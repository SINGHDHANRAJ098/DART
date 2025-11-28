import 'package:dartprograming/Auth/otp.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  bool _autoValidate = false;
  bool _isChecked = true;
  bool _isSendingOtp = false;

  final Color redAccent = Colors.redAccent;
  final String fontFamily = 'Inter';

  bool get _isPhoneValid {
    return RegExp(r'^[0-9]{10}$').hasMatch(_phoneController.text.trim());
  }

  Future<void> _sendOtp() async {
    FocusScope.of(context).unfocus();

    if (!_isPhoneValid || !_isChecked) return;

    setState(() => _isSendingOtp = true);

    final phoneNumber = "+91${_phoneController.text.trim()}";

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),

        verificationCompleted: (PhoneAuthCredential credential) {},

        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? "Verification failed")),
          );
          setState(() => _isSendingOtp = false);
        },

        codeSent: (String verificationId, int? resendToken) {
          setState(() => _isSendingOtp = false);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminOtp(
                phone: phoneNumber,
                verificationId: verificationId,
              ),
            ),
          );
        },

        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      setState(() => _isSendingOtp = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      _sendOtp();
    } else {
      setState(() => _autoValidate = true);
    }
  }

  // LOGO
  // Widget _buildLogo() {
  //   // return Hero(
  //   //   tag: 'admin_logo',
  //   //   child: Image.asset(
  //   //     'images/easyfix.webp',
  //   //     height: 120,
  //   //     width: 200,
  //   //     fit: BoxFit.contain,
  //   //   ),
  //   // );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Form(
              autovalidateMode:
              _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
              key: _formKey,
              child: Column(
                children: [
                  // _buildLogo(),
                  // const SizedBox(height: 20),

                  Text(
                    "Admin Panel Login",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: fontFamily,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Admin Phone Number",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontFamily: fontFamily,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100,
                        ),
                        child: Text(
                          '+91',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: fontFamily,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            hintText: 'Enter admin phone number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) return 'Enter admin number';
                            if (!_isPhoneValid) return 'Enter valid 10-digit number';
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (v) => setState(() => _isChecked = v ?? false),
                      ),
                      Expanded(
                        child: Text(
                          "I agree to the Privacy Policy",
                          style: TextStyle(fontFamily: fontFamily),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: redAccent,
                      ),
                      onPressed:
                      (_isPhoneValid && _isChecked && !_isSendingOtp) ? _login : null,
                      child: _isSendingOtp
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                        "Send OTP",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
