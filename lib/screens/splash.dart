import 'package:app/constants/colors.dart';
import 'package:app/constants/fonts.dart';
import 'package:app/screens/registration.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds and then navigate to the RegistrationScreen
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>const  RegistrationScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: size.height * .3),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              blueOn.withOpacity(.3),
              blue.withOpacity(.1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            transform: const GradientRotation(2),
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.gif',
                height: size.height * .3,
                width: size.width * .6,
              ),
              Text(
                "Welcome to my app!..",
                style:FontStyles(). h3(),
              ),
            const  SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * .5,
                height: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  clipBehavior: Clip.antiAlias,
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(blue.withOpacity(.5)),
                    backgroundColor: white.withOpacity(.3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
