import 'package:flutter/material.dart';
import 'package:yuk_mancing/Constant/style.dart';

class FieldText extends StatelessWidget {
  final TextEditingController _editingController = TextEditingController();

  FieldText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "No Whatsapp",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: "Montserrat"),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 48,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: kLightGray.withOpacity(0.3),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: TextField(
            controller: _editingController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: "whatsapp number"),
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: kGray,
            ),
          ),
        ),
      ],
    );
  }
}
