import 'package:ecommerce_uts/screens/recovery_screen.dart';
import 'package:flutter/material.dart';
// import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({super.key});

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  TextEditingController textEditingController =
      new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Enter OTP",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                "Please check the OTP that we have sent to your number.",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              ),
              
              SizedBox(
                height: 30,
              ),
              // TextFieldPin(
              //     textController: textEditingController,
              //     autoFocus: false,
              //     codeLength: 4,
              //     alignment: MainAxisAlignment.center,
              //     defaultBoxSize: 60.0,
              //     margin: 10,
              //     selectedBoxSize: 55.0,
              //     textStyle: TextStyle(fontSize: 16),
              //     defaultDecoration: _pinPutDecoration.copyWith(
              //         border: Border.all(
              //             color:
              //                 Theme.of(context).primaryColor.withOpacity(0.6))),
              //     selectedDecoration: _pinPutDecoration,
              //     onChange: (code) {
              //       setState(() {});
              //     }),
                  SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecoveryScreen(),
                      ));
                },
                child: Text(
                  "Verify",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(55),
                  backgroundColor: Color(0xFF6C63FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
