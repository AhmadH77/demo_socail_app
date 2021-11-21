import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:social_app_demo/util/const.dart';
import 'package:social_app_demo/widgets/createVideoTextField.dart';

class SetDetails extends StatefulWidget {
   SetDetails({Key? key}) : super(key: key);

  @override
  State<SetDetails> createState() => _SetDetailsState();
}

class _SetDetailsState extends State<SetDetails> {

  bool value = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Details',
              style: TextStyle(fontSize: 20, fontFamily: 'regular'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: Image.asset('assets/images/2.jpg').image,
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    'You need to add details befor going live.',
                    style: TextStyle(
                        color: Colors.grey, fontSize: 11, fontFamily: 'regular'),
                  ),
                ],
              ),
            ),
            uploadDetailsForm(),
            options()
          ],
        ),
      ),
    );
  }

   uploadDetailsForm() {
    return Form(
      child: Column(
              children: [
                TextFieldItem(
                  type: 'title',
                  labelText: 'Write a title...',
                ),
                TextFieldItem(
                  type: 'description',
                  labelText: 'Description...',
                  maxLines: 3,
                ),
                TextFieldItem(
                  type: 'hashtag',
                  labelText: 'Hashtags',
                ),
              ],
            ),
    );
  }

  options() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Add Cover',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'regular'),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Tag People',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'regular'),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Add Location',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'regular'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Schedule a live',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'regular'),
              ),
            ),
            FlutterSwitch(
              height: 30,
              width: 60,
              value: value,
              borderRadius: 30.0,
              activeToggleColor: Constants.shortieHeader1,
              inactiveToggleColor: Colors.grey,
              activeColor: Colors.transparent,
              inactiveColor: Colors.transparent,
              switchBorder: Border.all(color: Colors.black),
              activeText: '',
              inactiveText: '',
              showOnOff: true,
              onToggle: (val) {
                setState(() {
                  value = val;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
