import 'package:flutter/material.dart';

class TextFieldItem extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? type;
  final int? maxLines;

  TextFieldItem({Key? key, this.controller, this.labelText, this.type, this.maxLines = 1})
      : super(key: key);

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldItem> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    if (widget.type != 'password')
      setState(() {
        isObscure = false;
      });

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        //TODO CHANGE keyboardType BY TYPE
        validator: (value) {
          return null;
        },
        textAlign: TextAlign.start,
        obscureText: isObscure,
        controller: widget.controller,
        maxLines: widget.maxLines,
        style: TextStyle(fontSize: 15,fontFamily: 'regular'),
        decoration: InputDecoration(
          suffixIcon: widget.type == 'password'
              ? GestureDetector(
                  child:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                  onTap: () {
                    print('test');
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                )
              : null,
          labelText: widget.labelText,
          border: InputBorder.none
        ),
      ),
    );
  }
}
