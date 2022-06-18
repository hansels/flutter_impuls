import 'package:flutter/material.dart';
import 'package:flutter_impuls/configs/configs.dart';

class LongRaisedButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final bool disabled;
  final Color color;
  final double dividedBy;

  LongRaisedButton({
    @required this.onPressed,
    @required this.child,
    this.disabled = false,
    this.color = Configs.primaryColor,
    this.dividedBy = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / dividedBy,
      child: RaisedButton(
        shape: Configs.roundedRectangleBorder(),
        color: color,
        onPressed: disabled ? null : onPressed,
        child: child,
      ),
    );
  }
}
