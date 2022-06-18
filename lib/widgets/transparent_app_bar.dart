import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_impuls/widgets/custom/custom_text.dart';

class TransparentAppBar extends StatefulWidget {
  final String title;
  final bool withBackButton;
  final List<Widget> actions;

  const TransparentAppBar({
    Key key,
    this.title = "",
    this.withBackButton = true,
    this.actions,
  }) : super(key: key);

  @override
  _TransparentAppBarState createState() => _TransparentAppBarState();
}

class _TransparentAppBarState extends State<TransparentAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomText(widget.title, fontSize: 20),
      centerTitle: true,
      leading:
          !widget.withBackButton ? null : const BackButton(color: Colors.black),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: widget.actions,
    );
  }
}
