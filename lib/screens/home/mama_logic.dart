import 'dart:convert';
import 'dart:math';

import 'package:flutter_impuls/functions/enum_parser.dart';
import 'package:flutter_impuls/functions/token_version.dart';
import 'package:flutter_impuls/models/bank/bank.dart';
import 'package:flutter_impuls/models/bank/bank_helper.dart';
import 'package:flutter_impuls/models/item/item.dart';
import 'package:flutter_impuls/models/item/item_helper.dart';
import 'package:flutter_impuls/models/reply/reply.dart';
import 'package:flutter_impuls/models/session/session.dart';
import 'package:flutter_impuls/models/transaction/transaction.dart';
import 'package:flutter_impuls/models/transaction/transaction_helper.dart';
import 'package:flutter_impuls/models/user/user.dart';
import 'package:flutter_impuls/models/user/user_helper.dart';
import 'package:flutter_impuls/models/wishlist/wishlist.dart';
import 'package:flutter_impuls/models/wishlist/wishlist_helper.dart';

class MamaLogic {
  static final _itemHelper = ItemHelper();
  static final _bankHelper = BankHelper();
  static final _transactionHelper = TransactionHelper();
  static final _wishlistHelper = WishlistHelper();

  static Future<Reply> getReply(Session session, String message) async {
    User user = await TokenVersion.getUser();
    if (session?.item?.itemData == null || session.item.itemData.isEmpty) {
      Item item = await _itemHelper.getItem(message);

      if (item.isEmpty) {
        return Reply(
          session: session,
          replies: [
            "Aduh, Mama tidak mengerti apa yang kamu mau. Coba Lagi nanti ya.",
          ],
          mamaEmotion: "worried",
        );
      }

      session.item = item;
      return Reply(
        session: session,
        replies: replyForQuantity(session),
        mamaEmotion: "proud",
      );
    }

    if (session.quantity == null || session.quantity == 0) {
      session.quantity = parseMessageForQuantity(message);
      Iterable<Transaction> transactions =
          await _transactionHelper.getListByUserId(
        session.userId,
        EnumParser.getString(session.item.itemCategory),
      );
      return Reply(
        session: session,
        replies: replyForReason(
          session,
          transactions != null && transactions.isNotEmpty,
        ),
        mamaEmotion: "pog",
      );
    }

    if (session.reason == null || session.reason.isEmpty) {
      session.reason = message;

      int totalPaymentPrice = session.quantity * session.item.itemPrice;

      Iterable<Bank> banks = await _bankHelper.getListByUserId(session.userId);
      Iterable<Transaction> transactions =
          await _transactionHelper.getListByUserId(
        session.userId,
        EnumParser.getString(session.item.itemCategory),
      );

      int totalBalance = 0;

      for (var bank in banks) {
        totalBalance += bank.amount;
      }

      for (var transaction in transactions) {
        totalBalance -= transaction.amount;
      }

      Transaction transaction;
      if (transactions.isNotEmpty) {
        transaction = transactions.first;
      }

      double scoring = 1;

      double categoryScoring = 0;
      double spendingScoring = 0;
      double reasonScoring = 0.01;
      double itemRatingScoring = 0;
      double timeScoring = 0;

      itemRatingScoring = 0.3 - ((session.item.itemRanking / 10) * 0.3);
      spendingScoring = poisson(totalPaymentPrice / (totalBalance * 0.7), 1);
      timeScoring = transaction != null
          ? poisson(
              1 /
                  (1 -
                              (transaction.daySinceLastPurchase /
                                  session.item.itemDuration) ==
                          1
                      ? 1.01
                      : (transaction.daySinceLastPurchase /
                          session.item.itemDuration)),
              1)
          : 0;
      categoryScoring = transaction != null
          ? poisson(
              1 /
                  (1 - (transaction.daySinceLastPurchase / 100) == 1
                      ? 1.01
                      : (transaction.daySinceLastPurchase / 100)),
              1)
          : 0;

      scoring = scoring -
          itemRatingScoring -
          spendingScoring -
          timeScoring -
          categoryScoring -
          reasonScoring;

      print(scoring);

      if (totalBalance < totalPaymentPrice) {
        session.verdict = false;
        session.rejectType = 3;
        return Reply(
          session: session,
          replies: [
            "Hmm, Mama lihat pengeluaran kamu sudah besar di bulan ini. Lebih baik pembeliannya ditunda aja ya untuk bulan depan",
          ],
          mamaEmotion: "worried",
        );
      }

      if (scoring > 0.5) {
        session.verdict = true;
        return Reply(
          session: session,
          replies: [
            "Mama Setuju untuk membeli ${session.quantity} produk ${EnumParser.getString(session.item.itemCategory)} ini${totalPaymentPrice > 100000 ? ", tolong jaga baik baik barangnya ya kalau sudah dibeli, ini hasil dari usaha kamu lho..." : "."}",
            "Beli Barangnya disini ya, ${user.getFirstName()}",
          ],
          mamaEmotion: "proud",
        );
      } else {
        session.verdict = false;

        Wishlist wishlist = Wishlist(
          id: randomString(),
          itemCategory: session.item.itemCategory,
          name: EnumParser.getString(session.item.itemCategory),
          progress: 0,
          target: session.item.itemPrice,
          userId: session.userId,
        );
        _wishlistHelper.create(wishlist);
        return Reply(
          session: session,
          replies: [
            "Wah, Barangnya sepertinya kurang cocok dengan kondisi kamu sekarang ini, lebih baik tunggu barangnya rusak atau sangat dibutuhkan dulu ya",
            "Uang yang ada sebaiknya kamu tabung saja untuk mewujudkan Wishlist kamu",
            "Untuk sementara ini, mama catat dulu ya barangnya"
          ],
          mamaEmotion: "worried",
        );
      }
    }
  }

  static int parseMessageForQuantity(String message) {
    List<String> words = message.split(" ");

    for (String word in words) {
      try {
        int quantity = int.parse(word);
        if (quantity > 0) {
          return quantity;
        }
      } catch (e) {
        continue;
      }
    }

    return 1;
  }

  static List<String> replyForQuantity(Session session) {
    return [
      "Ooh, mau beli ${EnumParser.getString(session.item.itemCategory)} ya, memangnya mau beli berapa banyak?"
    ];
  }

  static List<String> replyForReason(
      Session session, bool alreadyHaveSimilarItem) {
    if (alreadyHaveSimilarItem) {
      return [
        "Memangnya kepa kamu mau beli ini? Kan kamu sudah punya produk ${EnumParser.getString(session.item.itemCategory)} yang dibeli sebelumnya"
      ];
    } else {
      return ["Memangnya kenapa kamu mau beli ini?"];
    }
  }

  static double sigmoid(double x) {
    return 1 / (1 + pow(e, -x));
  }

  static int factorial(int x) {
    if (x == 0) {
      return 1;
    } else {
      return x * factorial(x - 1);
    }
  }

  static double poisson(double x, int degree) {
    return pow(e, -x) * pow(x, degree) / factorial(degree);
  }

  static String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }
}
