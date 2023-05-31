import 'package:flutter/material.dart';
import 'package:travel_crew/services/auth_state.dart';
import 'package:provider/provider.dart';
import 'package:travel_crew/views/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: [
            Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _email,
              decoration: InputDecoration(hintText: "email"),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "password",
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  AuthState state =
                      Provider.of<AuthState>(context, listen: false);
                  state.login(_email.toString(), _password.toString());
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const Home()));
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text("SignUp"))
          ],
        ),
      ),
    );
  }
}
