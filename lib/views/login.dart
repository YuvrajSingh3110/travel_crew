import 'package:appwrite/appwrite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:travel_crew/navBar/bottomNavBar.dart';
import 'package:travel_crew/services/auth_state.dart';
import 'package:provider/provider.dart';
import 'package:travel_crew/services/localDB.dart';
import 'package:travel_crew/views/home.dart';
import 'package:travel_crew/views/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  signIn() async {
    try {
      AuthState state = Provider.of<AuthState>(context, listen: false);
      await state.login(
          email: _email.text.toString(), password: _password.text.toString());
    } catch (e) {
      print("login failed");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xff141419),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset(
                  "lib/assets/images/loginScreen.png",
                  fit: BoxFit.cover,
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white)),
                  child: Column(
                    children: [
                      Text(
                        "Log In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _email,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.password,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _password,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          height: 50,
                          width: 175,
                          decoration: BoxDecoration(
                            color: Color(0xff312e38),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: InkWell(
                            child: Text(
                              "Sign In ->",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            onTap: () async {
                              await signIn();

                              await LocalDB.getUserId().then((value) {
                                if (value != null) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const BottomNavBar()));
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "New here ?",
                            style: TextStyle(color: Colors.white)),
                        TextSpan(
                            text: "Sign Up",
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()));
                              }),
                      ])),
                      // ElevatedButton(onPressed: (){
                      //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()));
                      // }, child: Text("Sign up")),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Divider(
                            color: Colors.white,
                            thickness: 5,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Text(
                            "or",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 5,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SignInButton(Buttons.GoogleDark, onPressed: () {})
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
