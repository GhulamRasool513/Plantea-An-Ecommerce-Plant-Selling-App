import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantea/Screens/home_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:plantea/Modals/extracted_widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plantea/Screens/registration_screen.dart';
import 'package:plantea/main.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool value = false;
  bool passwordVisiblity = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('Login Screen');
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('homescreen');
            return HomeScreen();
          } else {
            print('Login Screen');
            return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  //Arrow to Exit The App.
                  leading: ExitArrow(Colors.white),
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                ),
                backgroundColor: Colors.white,
                //Screen Body
                body: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 590.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Row for leaf image and text.
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/Plantea Logo.png',
                              height: 50,
                            ),
                            AnimatedTextKit(
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  ColorizeAnimatedText('Plantea',
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 27.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Lobster',
                                      ),
                                      speed: Duration(milliseconds: 500),
                                      colors: [
                                        Colors.red,
                                        Colors.green,
                                        Colors.yellow,
                                        Colors.purple,
                                        Colors.blue,
                                      ]),
                                  TypewriterAnimatedText(
                                    'Plantea',
                                    speed: Duration(milliseconds: 400),
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 27.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Lobster',
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                        SizedBox(
                          height: 40.0,
                          width: 245.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Nature Is In ',
                                style: TextStyle(
                                    fontSize: 27.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontFamily: 'Lobster'),
                              ),
                              AnimatedTextKit(
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    RotateAnimatedText(
                                      'YOU',
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 27.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Lobster',
                                      ),
                                    ),
                                    RotateAnimatedText(
                                      'ME',
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 27.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Lobster',
                                      ),
                                    ),
                                    RotateAnimatedText(
                                      'Everything',
                                      rotateOut: false,
                                      textStyle: TextStyle(
                                        color: Color(0xff109C5B),
                                        fontSize: 27.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Lobster',
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                        Text(
                          'Log In To Your Account',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //TextFields

                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15.0, right: 15),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (email) => email != null &&
                                            !EmailValidator.validate(email)
                                        ? 'Enter valid email'
                                        : null,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade200),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15.0),
                                                bottomLeft:
                                                    Radius.circular(15.0),
                                                topRight: Radius.circular(10.0),
                                                bottomRight:
                                                    Radius.circular(15.0))),
                                        contentPadding: EdgeInsets.all(20.0),
                                        prefixIcon: Icon(Icons.email),
                                        hintText: 'Email',
                                        fillColor: Colors.grey.shade200,
                                        filled: true),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.0, right: 15),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) => value != null &&
                                            !EmailValidator.validate(value)
                                        ? 'Password must be 6 characters long'
                                        : null,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade200),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15.0),
                                                bottomLeft:
                                                    Radius.circular(15.0),
                                                topRight: Radius.circular(10.0),
                                                bottomRight:
                                                    Radius.circular(15.0))),
                                        contentPadding: EdgeInsets.all(20.0),
                                        prefixIcon: Icon(Icons.lock),
                                        hintText: 'Password',
                                        fillColor: Colors.grey.shade200,
                                        filled: true),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Row for "Remember me" checkBox.
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 1.3,
                              child: Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: Color(0xff109C5B)),
                                child: Checkbox(
                                  onChanged: (val) {
                                    val = value;
                                    setState(() {
                                      value == false
                                          ? value = true
                                          : value = false;
                                    });
                                  },
                                  checkColor: Colors.white,
                                  value: value,
                                  activeColor: Color(0xFF0ED679),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5.0),
                                        bottomLeft: Radius.circular(5.0),
                                        bottomRight: Radius.circular(5.0),
                                        topRight: Radius.circular(5.0)),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        //Sign In button.
                        SizedBox(
                          width: 370.0,
                          height: 55.0,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xff109C5B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    50.0,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              // final isValid = formKey.currentState!.validate();
                              // if(!isValid) return;
                              // bool spinner = true;
                              // if (spinner == true)
                              //   showDialog(
                              //       context: context,
                              //       builder: (context) => Center(
                              //             child: SpinKitCircle(
                              //               duration: Duration(seconds: 1),
                              //               size: 70.0,
                              //               color: Color(0xFF0ED679),
                              //             ),
                              //           ));
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim());
                              } on FirebaseAuthException catch (e) {
                                print(e);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Username doesn\'t exist"),
                                ));
                              }
                              // navigatorKey.currentState!
                              //     .popUntil((route) => route.isFirst);
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        //Row For Social Media Buttons Text Horizontal lines
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              HorizontalLines(100.0),
                              Text(
                                'or continue with',
                                style: TextStyle(
                                    color: Color(0xff616161), fontSize: 17.0),
                              ),
                              HorizontalLines(100.0),
                            ],
                          ),
                        ),
                        //Row of Social Media Buttons.
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SocialMediaButton(
                              Image.asset(
                                'images/facebook.png',
                                scale: 1.4,
                              ),
                            ),
                            SocialMediaButton(
                              Image.asset(
                                'images/google.png',
                                scale: 1.4,
                              ),
                            ),
                            SocialMediaButton(
                              Image.asset(
                                'images/apple.png',
                                scale: 1.3,
                              ),
                            ),
                          ],
                        ),
                        //Row of ending 'Register here' Text.
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dont\'t have an Account? ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 17.0),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RegistrationScreen.id);
                              },
                              child: Text(
                                ' Register Here',
                                style: TextStyle(
                                    color: Color(0xff02B763), fontSize: 17.0),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ));
          }
        });
  }
}
