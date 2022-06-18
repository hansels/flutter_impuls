import 'package:flutter_impuls/enums/chat_type.dart';
import 'package:flutter_impuls/functions/enum_parser.dart';

class Chat {
  final String id;
  final String userId;
  final String content;
  final ChatType chatType;

  Chat({this.id, this.userId, this.content, this.chatType});

  factory Chat.fromMap(Map<String, dynamic> data) {
    return Chat(
      id: data['id'],
      userId: data['userId'],
      content: data['content'],
      chatType: EnumParser.getEnum<ChatType>(ChatType.values, data['chatType']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
      'chatType': EnumParser.getString(chatType),
    };
  }
}
