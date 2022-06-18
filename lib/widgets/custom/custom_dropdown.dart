import 'package:flutter/material.dart';
import 'package:flutter_impuls/configs/configs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDropdown extends StatefulWidget {
  final bool isExpanded;
  final String hint;
  final String selected;
  final void Function(String) onChanged;
  final List<String> list;

  CustomDropdown({
    this.isExpanded = true,
    @required this.hint,
    @required this.selected,
    @required this.onChanged,
    @required this.list,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                isExpanded: widget.isExpanded,
                hint: Text(widget.hint),
                icon: const Icon(FontAwesomeIcons.caretDown),
                style: const TextStyle(
                  fontSize: 16,
                  color: Configs.primaryColor,
                  fontFamily: "Svenska",
                ),
                value: widget.selected,
                onChanged: widget.onChanged,
                items: widget.list
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
