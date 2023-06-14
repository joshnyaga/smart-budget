import 'package:budgetsmart/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../utils/constants.dart' as constants;
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    initialization();
  }
  void initialization() async {

    FlutterNativeSplash.remove();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(constants.MAIN_COLOR),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //logo
            Image.asset("assets/logos/logo_transparent.png", height: 200,),
            //illustration-fill the entire width
            Image.asset("assets/calculator.png", height: MediaQuery.of(context).size.height *0.35,),
            SizedBox(height: 20,),
            //box
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 300,
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 30,),
                      const Text(
                        "Create your own budget and analyse your spending",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(constants.MAIN_COLOR),
                            fontSize: 18
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15,),
                      Text(
                        "Choose your currency and track your spendings",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                            fontSize: 14
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(constants.MAIN_COLOR)
                          ),
                          child: const Center(
                            child: Icon(Icons.arrow_forward_sharp,color: Colors.white,),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
