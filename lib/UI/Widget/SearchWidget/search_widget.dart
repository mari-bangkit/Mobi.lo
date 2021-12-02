import 'package:flutter/material.dart';
import 'package:yuk_mancing/Constant/style.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  //final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    // required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const styleActive =
        TextStyle(color: Colors.black, fontStyle: FontStyle.italic);
    const styleHint = TextStyle(color: kLightGray);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 42,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kLightGray.withOpacity(0.6),
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: style.color),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    //widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        //onChanged: widget.onChanged,
      ),
    );
  }
}
