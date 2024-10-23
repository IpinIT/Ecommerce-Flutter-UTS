
import 'package:ecommerce_uts/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration (
      titleTextStyle: TextStyle(fontSize: 28,
      fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: TextStyle(fontSize: 19),
      bodyPadding: EdgeInsets.fromLTRB(16,0,16,16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Belanja Sekarang!",
          body: "Nikmati berbagai macam promo menarik berbelanja di IPIN SHOP!",
          image: Image.asset("images/splash1.png", width: 200,),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Diskon Besar Besaran!",
          body: "Nikmati berbagai macam promo menarik berbelanja di IPIN SHOP!",
          image: Image.asset("images/splash2.png", width: 200,),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Gratis Ongkir!",
          body: "Nikmati berbagai macam promo menarik berbelanja di IPIN SHOP!",
          image: Image.asset("images/splash3.png", width: 200,),

          decoration: pageDecoration,
          footer: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(), ));
              },
              child: Text("Ayo Berbelanja!",
              style: TextStyle(
                fontSize: 18,
              ),),
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(55),
                backgroundColor: Color(0xFF6C63FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                foregroundColor: Colors.white,
                ),
              ),
            ),
        ),  
      ],
      showSkipButton: false,
      showDoneButton: false,
      showBackButton: true,
      back: Text("Back", style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Color(0xFF6C63FF)
      ),),
      next: Text("Next", style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Color(0xFF6C63FF)
      ),),

      onDone: (){},
      onSkip: (){},
      dotsDecorator: DotsDecorator(
        size: Size.square(10),
        activeSize: Size(20,10),
        activeColor: Color(0xFF6C63FF),
        color: Colors.black26,
        spacing: EdgeInsets.symmetric(horizontal: 3),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        )),
    );
  }
}