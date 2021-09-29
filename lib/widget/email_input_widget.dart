import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';

class EmailInput extends StatefulWidget {
  final TextEditingController emailController;

  const EmailInput({Key? key, required this.emailController})
      : super(
          key: key,
        );

  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
      child: TextFormField(
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.emailAddress,
          controller: widget.emailController,
          validator: (value) =>
              EmailValidator.validate(value!) == true ? null : invalidEmail,
          decoration: InputDecoration(
            hintText: email,
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
