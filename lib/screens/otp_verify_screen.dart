import 'package:ecommerce_uts/screens/recovery_number_verify.dart';
import 'package:ecommerce_uts/screens/recovery_screen.dart';
import 'package:flutter/material.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({super.key});

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  final List<TextEditingController> _otpControllers = List.generate(4, (_) => TextEditingController());

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
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Please check the OTP that we have sent to your number.",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 50),

              // Input OTP
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 40,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _otpControllers[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1, // Hanya 1 karakter per kotak
                        decoration: InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 24),
                        onChanged: (value) {
                          // Pindah ke kotak berikutnya jika ada input
                          if (value.length == 1 && index < 5) {
                            FocusScope.of(context).nextFocus();
                          }
                          // Kembali ke kotak sebelumnya jika karakter dihapus
                          if (value.isEmpty && index > 0) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),
              ),

              SizedBox(height: 40),

              // Tombol Verifikasi
              ElevatedButton(
                onPressed: () {
                  // Logika verifikasi OTP bisa ditambahkan di sini
                  String otp = _otpControllers.map((controller) => controller.text).join();
                  print("OTP Entered: $otp"); // Cetak OTP yang dimasukkan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecoveryNumberVerify(),
                    ),
                  );
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
                    borderRadius: BorderRadius.circular(8),
                  ),
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
