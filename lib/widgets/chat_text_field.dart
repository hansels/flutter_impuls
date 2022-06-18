import 'package:flutter/material.dart';
import 'package:flutter_impuls/configs/configs.dart';

class ChatTextField extends StatefulWidget {
  final Future<void> Function(String) onSend;
  ChatTextField({@required this.onSend});

  @override
  _ChatTextFieldState createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Tuliskan Pertanyaanmu disini..",
                ),
                style: const TextStyle(fontSize: 14.0),
                textCapitalization: TextCapitalization.sentences,
                cursorColor: Configs.primaryColor,
                minLines: 1,
                maxLines: 3,
                controller: _controller,
              ),
            ),
            Material(
              color: Colors.grey[200],
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                radius: 30,
                onTap: () {
                  widget.onSend(_controller.text);
                  _controller.text = "";
                },
                splashColor: Colors.grey[350],
                highlightColor: Colors.grey[350],
                child: Container(
                  width: 34,
                  height: 34,
                  child: Icon(
                    Icons.send,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
