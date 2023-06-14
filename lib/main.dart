import 'package:budgetsmart/screens/starter/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/constants.dart' as constants;

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/logos/logo_transparent.png"), context);
    precacheImage(AssetImage("assets/calculator.png"), context);
    return MaterialApp(
      title: 'Smart Budget',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color(constants.MAIN_COLOR)),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen()
    );
  }
}
