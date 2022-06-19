import 'dart:math';

import 'package:flutter_impuls/functions/enum_parser.dart';
import 'package:flutter_impuls/functions/token_version.dart';
import 'package:flutter_impuls/models/bank/bank.dart';
import 'package:flutter_impuls/models/bank/bank_helper.dart';
import 'package:flutter_impuls/models/item/item.dart';
import 'package:flutter_impuls/models/item/item_helper.dart';
import 'package:flutter_impuls/models/reply/reply.dart';
import 'package:flutter_impuls/models/session/session.dart';
import 'package:flutter_impuls/models/session/session_helper.dart';
import 'package:flutter_impuls/models/transaction/transaction.dart';
import 'package:flutter_impuls/models/transaction/transaction_helper.dart';
import 'package:flutter_impuls/models/user/user.dart';
import 'package:flutter_impuls/models/user/user_helper.dart';
import 'package:flutter_impuls/models/wishlist/wishlist_helper.dart';

class MamaLogic {
  static final _itemHelper = ItemHelper();
  static final _sessionHelper = SessionHelper();
  static final _userHelper = UserHelper();
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
      return Reply(
        session: session,
        replies: replyForReason(session),
        mamaEmotion: "pog",
      );
    }

    if (session.reason == null || session.reason.isEmpty) {
      session.reason = message;

      int totalPaymentPrice = session.quantity * session.item.itemPrice;

      Iterable<Bank> banks = await _bankHelper.getListByUserId(session.userId);
      Iterable<Transaction> transactions =
          await _transactionHelper.getListByUserId(session.userId);

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

      double scoring = 0;
      double categoryScoring = 0;
      double spendingScoring = 0;
      double reasonScoring = 0.5;
      double itemRatingScoring = 0;
      double timeScoring = 0;

      itemRatingScoring = (session.item.itemRanking / 10) * 0.5;
      spendingScoring =
          sigmoid(totalPaymentPrice / totalBalance, derivative: true) * 0.3;
      timeScoring = transaction != null
          ? sigmoid(
                  transaction.daySinceLastPurchase / session.item.itemDuration,
                  derivative: true) *
              0.2
          : 0;
      categoryScoring = transaction != null
          ? sigmoid((transaction.daySinceLastPurchase) / 100,
                  derivative: true) *
              0.2
          : 0;

      scoring = itemRatingScoring -
          spendingScoring -
          timeScoring -
          categoryScoring +
          reasonScoring;

      if (scoring > 0.5) {
        return Reply(
          session: session,
          replies: [
            "Mama Setuju untuk membeli ${session.quantity} produk ${EnumParser.getString(session.item.itemCategory)} ini${totalPaymentPrice > 100000 ? ", tolong jaga baik baik barangnya ya kalau sudah dibeli, ini hasil dari usaha kamu lho..." : "."}"
                "Beli Barangnya disini ya, ${user.name}",
          ],
          mamaEmotion: "proud",
        );
      } else {
        return Reply(
          session: session,
          replies: [],
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

  static List<String> replyForReason(Session session) {
    bool alreadyHaveSimilarItem = true;
    if (alreadyHaveSimilarItem) {
      return [
        "Memangnya kenapa kamu mau beli ini? Kan kamu sudah punya produk ${EnumParser.getString(session.item.itemCategory)} yang dibeli sebelumnya"
      ];
    } else {
      return ["Memangnya kenapa kamu mau beli ini?"];
    }
  }

  static double sigmoid(double x, {bool derivative = false}) {
    if (!derivative) {
      return 1 / (1 + exp(-x));
    }
    return x * (1 - x);
  }
}
