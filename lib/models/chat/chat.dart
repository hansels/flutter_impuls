import 'package:flutter_impuls/enums/chat_type.dart';
import 'package:flutter_impuls/functions/enum_parser.dart';

class Chat {
  final String id;
  final String userId;
  final String sessionId;
  final String content;
  final ChatType chatType;

  Chat({this.id, this.userId, this.sessionId, this.content, this.chatType});

  static Chat fromMap(Map<String, dynamic> data) {
    return Chat(
      id: data['id'],
      userId: data['userId'],
      sessionId: data['sessionId'],
      content: data['content'],
      chatType: EnumParser.getEnum<ChatType>(ChatType.values, data['chatType']),
    );
  }

  Map<String, dynamic> toVariables() {
    return {
      'id': id,
      'userId': userId,
      'sessionId': sessionId,
      'content': content,
      'chatType': EnumParser.getString(chatType),
    };
  }
}
