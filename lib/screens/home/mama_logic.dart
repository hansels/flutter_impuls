import 'package:flutter_impuls/enums/chat_type.dart';
import 'package:flutter_impuls/functions/token_version.dart';
import 'package:flutter_impuls/models/chat/chat.dart';
import 'package:flutter_impuls/models/chat/chat_helper.dart';
import 'package:flutter_impuls/models/item/item.dart';
import 'package:flutter_impuls/models/item/item_helper.dart';
import 'package:flutter_impuls/models/reply/reply.dart';
import 'package:flutter_impuls/models/session/session.dart';
import 'package:flutter_impuls/models/session/session_helper.dart';
import 'package:flutter_impuls/models/user/user.dart';
import 'package:flutter_impuls/models/user/user_helper.dart';
import 'package:flutter_impuls/models/wishlist/wishlist_helper.dart';

class MamaLogic {
  static final _itemHelper = ItemHelper();
  static final _chatHelper = ChatHelper();
  static final _sessionHelper = SessionHelper();
  static final _userHelper = UserHelper();
  static final _wishlistHelper = WishlistHelper();

  static Future<Reply> getReply(Session session, String message) async {
    final now =
        100000000000000 - (DateTime.now().toUtc().millisecondsSinceEpoch);
    final user = await TokenVersion.getUser();

    final chat = Chat(
      id: now.toString(),
      sessionId: session.id,
      userId: user.id,
      content: message,
      chatType: ChatType.Text,
    );

    await _chatHelper.create(chat);

    if (session?.item?.itemData == null || session.item.itemData.isEmpty) {
      Item item = await _itemHelper.getItem(message);

      if (item.isEmpty) {
        return Reply(session: session, replies: ["Mama Bingung"]);
      }

      session.item = item;
      // return Reply(
      //   session: session,
      //   replies: await replyForItemData(user),
      // );
    }
    // if (session.quantity == null || session.quantity == 0) {
    //   return await replyForQuantity();
    // }

    // if (session.reason == null || session.reason.isEmpty) {
    //   return await replyForReason();
    // }
  }

  static String parseReplyForQuantity(Session session) {
    if (session.quantity == null || session.quantity == 0) {
      return "Mau Beli Berapa Banyak?";
    }
  }
}
