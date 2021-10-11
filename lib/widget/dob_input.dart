import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';
import 'package:social_app_demo/util/app_actions.dart';

DateFormat dateFormat = DateFormat('dd/MM/yyyy');
DateTime dateTime = DateTime.now();

class DobInput extends StatefulWidget {
  final TextEditingController controller;

  const DobInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _DobInputState createState() => _DobInputState();
}

class _DobInputState extends State<DobInput> {
  String? dateSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
      child: TextFormField(
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.name,
          controller: widget.controller,
          readOnly: true,
          onTap: () async {
            final selectedDate = await AppActions.selectDate(context);
            if (selectedDate == null) return;
            dateSelected = dateFormat.format(selectedDate);
            setState(() {
              widget.controller.text = dateSelected!;
            });
          },
          validator: (value) =>
              value!.trim().isNotEmpty || value.length > 3 ? null : requireD,
          decoration: InputDecoration(
            hintText: dob,
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
