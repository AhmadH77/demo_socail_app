import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';

class NameInput extends StatefulWidget {
  final TextEditingController controller;
  final hint;

  const NameInput({Key? key, required this.controller, required this.hint})
      : super(key: key);

  @override
  _NameInputState createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
      child: TextFormField(
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.name,
          controller: widget.controller,
          validator: (value) =>
              value!.trim().isNotEmpty || value.length > 3 ? null : requireD,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(inherit: true, color: Colors.white),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2)),
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          )),
    );
  }
}
