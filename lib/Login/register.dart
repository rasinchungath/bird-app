import 'dart:developer';
import 'package:flutter/material.dart';
import 'otp.dart';
import 'package:firebase_auth/firebase_auth.dart';

// enum MobileVerificationState {
//   SHOW_MOBILE_FORM_STATE,
//   SHOW_OTP_FORM_STATE,
// }

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // MobileVerificationState currentState =
  //     MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  //final otpController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId="";

  bool showLoading = false;

  

  bool visible = false;

  TextEditingController mobNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Registration',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter your phone number. we'll send you a verification code",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      maxLength: 10,
                      controller: mobNumber,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (value.length == 10) {
                          setState(() {
                            visible = true;
                          });
                        } else {
                          setState(() {
                            visible = false;
                          });
                        }
                      },
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
                        prefix: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            '(+91)',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        suffixIcon: visible == true
                            ? const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 28,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            showLoading = true;
                          });
                          log(mobNumber.text);
                          await _auth.verifyPhoneNumber(
                            phoneNumber: '+91${mobNumber.text}',
                            verificationCompleted: (PhoneAuthCredential) {
                              setState(() {
                                showLoading = false;
                              });
                              log('verifyphone number');
                            },
                            verificationFailed: (verificationFailed) async {
                              setState(() {
                                showLoading = false;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('verification failed'),
                              ));

                              log('verification failed');
                            },
                            codeSent: (verificationId, resendingToken) async {
                              setState(() {
                                showLoading = false;
                                // currentState =
                                //     MobileVerificationState.SHOW_OTP_FORM_STATE;
                                verificationId = verificationId;
                              });
                            },
                            codeAutoRetrievalTimeout: (verificationId) {},
                          );

                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => Otp(
                                      mobNumber: mobNumber,
                                      verificationId:verificationId,
                                    )),
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.teal),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text(
                            'Send',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
