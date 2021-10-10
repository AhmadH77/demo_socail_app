import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';
import 'package:social_app_demo/screens/mainScreen.dart';
import 'package:social_app_demo/widget/auth_app_bar.dart';
import 'package:social_app_demo/widget/auth_button.dart';
import 'package:social_app_demo/widget/auth_error_response.dart';
import 'package:social_app_demo/widget/phone_number_input.dart';

class LoginPage extends StatefulWidget {
  final bool isLogin;

  const LoginPage({Key? key, required this.isLogin}) : super(key: key);

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
    return Form(
      key: _formKey,
      child: Container(
        child: isNumberValid ? enterOTP() : enterMobileNumber(),
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
          padding: const EdgeInsets.only(
            top: fortyDp,
            left: sixteenDp,
          ),
          child: !widget.isLogin
              ? AuthAppBar(
                  onTap: () async {
                    print("sfdf");
                  },
                  buttonName: login,
                  onBackArrowPressed: () => Navigator.pop(context))
              : AuthAppBar(
                  onTap: () {
                    print("sfdf");
                  },
                  buttonName: signup,
                  onBackArrowPressed: () {
                    print("sfdf");
                    return Navigator.of(context).pop();
                  },
                ),
        ),
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
                buttonName: next, onButtonTapped: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MainScreen(),
              ));
            }, isAuth: false),
          ),
          AuthError(
            message: incorrectOTP,
          ),
        ],
      ),
    );
  }
}
