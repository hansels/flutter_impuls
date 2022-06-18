import 'package:flutter/material.dart';
import 'package:flutter_impuls/configs/configs.dart';

import 'link_text_span.dart';

class LinkText extends StatelessWidget {
  final String text;
  final String url;

  LinkText({this.text, this.url});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: LinkTextSpan(
        text: text,
        style: const TextStyle(
          color: Configs.secondaryColor,
          fontFamily: "Svenska",
          decoration: TextDecoration.underline,
          fontSize: 15,
        ),
        url: url,
      ),
    );
  }
}
