import 'package:budgetsmart/components/text_field.dart';
import 'package:budgetsmart/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import "../../utils/constants.dart" as constants;
import '../../components/validation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  bool _submitted = false;

  // dispose it when the widget is unmounted
  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() => _submitted = true);
    if(validation.errorEmail(_controllerEmail) == null && validation.errorPassword(_controllerPassword) == null ){
      //submit the form
      print("Its okay");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(constants.MAIN_COLOR),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Image.asset(
                  "assets/logos/logo_transparent.png",
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0)),
                      color: Colors.white,
                    ),

                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Welcome Back!",
                                style: TextStyle(
                                    color: Color(constants.MAIN_COLOR),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Dont have an account?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.grey[400]),
                                  ),
                                  TextButton(
                                      onPressed: () => {
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => RegisterScreen()))
                                      },
                                      child: Text(
                                        "Register",
                                        style: TextStyle(
                                            color: Color(constants.MAIN_COLOR),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ))
                                ],
                              ),
                              TextFieldWidget(
                                  labeltext: "Email",
                                  hintText: "Enter your email",
                                  obsecure: false,
                                  error: _submitted?validation.errorEmail(_controllerEmail):null,
                                  controller: _controllerEmail,
                                  submitted: _submitted),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFieldWidget(
                                  labeltext: "Password",
                                  hintText: "Enter password",
                                  obsecure: true,
                                  error: _submitted? validation.errorPassword(_controllerPassword):null,
                                  controller: _controllerPassword,
                                  submitted: _submitted),
                              SizedBox(height: 25.0,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: ElevatedButton(
                                      onPressed: _submit,

                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(constants.MAIN_COLOR), // background
                                        onPrimary: Colors.white, // foreground
                                        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                      ),
                                      child: Text(
                                        "Login",

                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                )
              ],
            ),
          ),
        ));
  }
}
