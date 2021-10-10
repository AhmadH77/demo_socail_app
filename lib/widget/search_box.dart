import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';

class SearchBox extends StatefulWidget {
  final TextEditingController controller;
  final Color borderColor;

  const SearchBox(
      {Key? key, required this.controller, required this.borderColor})
      : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  get seventeenDp => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: sixteenDp, vertical: sixteenDp),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(sixteenDp),
          border: Border.all(color: widget.borderColor, width: 1.5)),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: widget.controller,
        style: const TextStyle(
            color: Color(0xff929292),
            fontSize: fourteenDp,
            fontFamily: 'regular',
            fontWeight: FontWeight.w400),
        keyboardType: TextInputType.number,
        validator: (value) =>
            value!.trim().isNotEmpty && value.length > 5 ? null : requireD,
        decoration: InputDecoration(
          hintText: lookForInterest,
          contentPadding: EdgeInsets.all(eightDp),
          hintStyle: const TextStyle(inherit: true, color: Colors.black45),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
