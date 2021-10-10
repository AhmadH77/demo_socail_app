import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';
import 'package:social_app_demo/screens/mainScreen.dart';
import 'package:social_app_demo/widget/auth_app_bar.dart';
import 'package:social_app_demo/widget/auth_button.dart';
import 'package:social_app_demo/widget/auth_error_response.dart';
import 'package:social_app_demo/widget/email_input_widget.dart';
import 'package:social_app_demo/widget/name_input.dart';
import 'package:social_app_demo/widget/phone_number_input.dart';

class SignupPage extends StatefulWidget {
  final bool isSignup;

  const SignupPage({Key? key, required this.isSignup}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  String selectedCountryCode = '';

  //method to select country code when changed
  void _onCountryChange(CountryCode countryCode) {
    selectedCountryCode = countryCode.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: fortyDp,
            left: sixteenDp,
          ),
          child: !widget.isSignup
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
          padding: const EdgeInsets.only(left: sixteenDp, top: oneFiftyDp),
          child: Text(
            signupToJoinOurFamily,
            style: TextStyle(
                color: Colors.white,
                fontSize: twentyEightDp,
                fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        NameInput(controller: userNameController, hint: userName),
        SizedBox(
          height: tenDp,
        ),
        NameInput(controller: nameController, hint: name),
        SizedBox(
          height: tenDp,
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
        SizedBox(
          height: tenDp,
        ),
        EmailInput(
          emailController: emailController,
        ),
        SizedBox(
          height: tenDp,
        ),
        NameInput(controller: dobController, hint: dob),
        Container(
          padding: EdgeInsets.only(
            top: fiftyDp,
          ),
          child: AuthButton(
              buttonName: signup,
              onButtonTapped: () {
                //if number is valid
                /* if (_formKey.currentState!.validate()) {
                      setState(() {

                      });
                    }*/

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ));
              },
              isAuth: false),
        ),
        SizedBox(
          height: tenDp,
        ),
        AuthError(
          message: mobileNumberAlreadyExists,
        )
      ],
    ));
  }
}
