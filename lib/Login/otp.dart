import 'dart:developer';
import 'package:bird_buddy/Screens/homeScreen.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController otpContoller1 = TextEditingController();
  TextEditingController otpContoller2 = TextEditingController();
  TextEditingController otpContoller3 = TextEditingController();
  TextEditingController otpContoller4 = TextEditingController();
  TextEditingController otpContoller5 = TextEditingController();
  TextEditingController otpContoller6 = TextEditingController();

  String code = '123456';
  String oTp = '';

  combineOtp() {
    // log('message===' +otpContoller1!.text);

    // if (otpContoller1!.text.isNotEmpty &&
    //     otpContoller2!.text.isNotEmpty &&
    //     otpContoller3!.text.isNotEmpty &&
    //     otpContoller4!.text.isNotEmpty &&
    //     otpContoller5!.text.isNotEmpty &&
    //     otpContoller6!.text.isNotEmpty) {
    //       log('combine here');

    // }
    //  oTp = otpContoller1!.text +
    //       otpContoller2!.text +
    //       otpContoller3!.text +
    //       otpContoller4!.text +
    //       otpContoller5!.text +
    //       otpContoller6!.text;
    // if (code == oTp) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
    // }
  }

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
                height: 30,
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter your verification code",
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
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextfieldOtp(
                            first: true,
                            last: false,
                            otpContoller: otpContoller1,
                          ),
                        ),
                        Expanded(
                          child: TextfieldOtp(
                            first: false,
                            last: false,
                            otpContoller: otpContoller2,
                          ),
                        ),
                        Expanded(
                          child: TextfieldOtp(
                            first: false,
                            last: false,
                            otpContoller: otpContoller3,
                          ),
                        ),
                        Expanded(
                          child: TextfieldOtp(
                            first: false,
                            last: false,
                            otpContoller: otpContoller4,
                          ),
                        ),
                        Expanded(
                          child: TextfieldOtp(
                            first: false,
                            last: false,
                            otpContoller: otpContoller5,
                          ),
                        ),
                        Expanded(
                          child: TextfieldOtp(
                            first: false,
                            last: true,
                            otpContoller: otpContoller6,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          log(otpContoller1.text);
                          combineOtp();
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
                            'Verify',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 18,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Resend New Code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextfieldOtp extends StatelessWidget {
  TextfieldOtp({
    required bool first,
    required bool last,
    required TextEditingController otpContoller,
  });
  bool first = true;
  bool last = false;
  TextEditingController otpContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: TextFormField(
          controller: otpContoller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.teal),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
