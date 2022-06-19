import 'package:flutter_impuls/models/session/session.dart';

class Reply {
  final Session session;
  final List<String> replies;
  final String mamaEmotion;

  Reply({this.session, this.replies, this.mamaEmotion});
}
