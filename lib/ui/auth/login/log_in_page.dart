import 'dart:ui';

import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';
import 'package:social_app_demo/widget/auth_app_bar.dart';
import 'package:social_app_demo/widget/auth_button.dart';
import 'package:social_app_demo/widget/bg_image.dart';
import 'package:social_app_demo/widget/phone_number_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedCountryCode = '';
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool isNumberValid = false;

  //method to select country code when changed
  void _onCountryChange(CountryCode countryCode) {
    selectedCountryCode = countryCode.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                child: BgImage(image: 'assets/images/4.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: fortyDp,
                  left: sixteenDp,
                ),
                child: isNumberValid
                    ? AuthAppBar(
                        onTap: () {},
                        buttonName: login,
                      )
                    : AuthAppBar(
                        onTap: () {},
                        buttonName: signup,
                      ),
              ),
              isNumberValid ? enterOTP() : enterMobileNumber(),
            ],
          ),
        ),
      ),
    );
  }

  //mobile number
  Widget enterMobileNumber() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: sixteenDp, top: twoHundredDp),
          child: Text(
            loginToExperience,
            style: TextStyle(
                color: Colors.white,
                fontSize: twentyEightDp,
                fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: selectedCountryCode.trim().isEmpty ? sixtyDp : ninetyDp,
              margin: EdgeInsets.only(left: sixteenDp),
              decoration: BoxDecoration(color: Colors.white),
              child: CountryCodePicker(
                padding: EdgeInsets.all(0),
                //country code
                onChanged: _onCountryChange,
                showFlag: false,
                showDropDownButton: true,
                initialSelection: selectedCountryCode,
                showOnlyCountryWhenClosed: false,
              ),
            ),
            Container(
                child: PhoneNumberInput(
              isOTP: false,
              controller: phoneNumberController,
            ))
          ],
        ),
        Container(
          padding: EdgeInsets.only(
            top: fiftyDp,
          ),
          child: AuthButton(
              buttonName: login,
              onButtonTapped: () {
                //if number is valid
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    isNumberValid = true;
                  });
                }
              },
              isAuth: false),
        )
      ],
    ));
  }

  //otp
  Widget enterOTP() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: twentyFourDp, top: twoHundredDp),
            child: Text(
              pleaseEnterOTP,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: twentyEightDp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              child: PhoneNumberInput(
            isOTP: true,
            controller: otpController,
          )),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: twentyDp),
              child: Text(
                resendOTP,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: fiftyDp,
            ),
            child: AuthButton(
                buttonName: next, onButtonTapped: () {}, isAuth: false),
          ),
          Container(
            //todo only show this when OTP IS INVALID
            margin: EdgeInsets.only(
                top: twentyDp, left: sixteenDp, right: sixteenDp),
            padding: EdgeInsets.all(fourDp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(sixteenDp),
                color: Colors.transparent.withOpacity(0.2)),
            child: Center(
              child: Text(
                incorrectOTP,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
