import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/strings.dart';

class PhoneNumberInput extends StatefulWidget {
  final controller;
  final bool isOTP;

  const PhoneNumberInput(
      {Key? key, required this.controller, required this.isOTP})
      : super(key: key);

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.isOTP
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width / 1.42,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.phone,
          controller: widget.controller,
          validator: (value) => widget.isOTP
              ? value!.trim().isNotEmpty && value.length == 6
                  ? null
                  : requireD
              : value!.length > 9
                  ? null
                  : requireD,
          decoration: InputDecoration(
            hintText: widget.isOTP ? OTP : mobileNumber,
            hintStyle: TextStyle(inherit: true, color: Colors.white),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2)),
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ));
  }
}
