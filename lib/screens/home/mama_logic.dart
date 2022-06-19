import 'package:flutter_impuls/functions/enum_parser.dart';
import 'package:flutter_impuls/models/item/item.dart';
import 'package:flutter_impuls/models/item/item_helper.dart';
import 'package:flutter_impuls/models/reply/reply.dart';
import 'package:flutter_impuls/models/session/session.dart';
import 'package:flutter_impuls/models/session/session_helper.dart';
import 'package:flutter_impuls/models/user/user_helper.dart';
import 'package:flutter_impuls/models/wishlist/wishlist_helper.dart';

class MamaLogic {
  static final _itemHelper = ItemHelper();
  static final _sessionHelper = SessionHelper();
  static final _userHelper = UserHelper();
  static final _wishlistHelper = WishlistHelper();

  static Future<Reply> getReply(Session session, String message) async {
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
      return Reply(
        session: session,
        replies: replyForVerdict(session),
        mamaEmotion: "proud",
      );
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
      "Ooh, mau ${EnumParser.getString(session.item.itemCategory)} ya, memangnya mau beli berapa banyak?"
    ];
  }

  static List<String> replyForReason(Session session) {
    bool alreadyHaveSimilarItem = true;
    if (alreadyHaveSimilarItem) {
      return [
        "Memangnya kenapa kamu mau beli ini? Kan kamu sudah punya ${session.item.itemCategory} yang dibeli sebelumnya"
      ];
    } else {
      return ["Memangnya kenapa kamu mau beli ini?"];
    }
  }

  static List<String> replyForVerdict(Session session) {
    return ["Mau Beli Berapa Banyak?"];
  }
}
