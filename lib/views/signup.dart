import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_crew/services/auth_state.dart';
import 'package:travel_crew/views/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _name = TextEditingController();
  TextEditingController _userid = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Text(
              "Signup",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _name,
              decoration: InputDecoration(hintText: "name"),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _userid,
              decoration: InputDecoration(hintText: "user id"),
            ),
            const SizedBox(height: 10.0),
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
                child: Text("Signup"),
                onPressed: () {
                  AuthState state =
                      Provider.of<AuthState>(context, listen: false);
                  state.createAccount(_name.toString(), _email.toString(), _password.toString(), _userid.toString());
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const Home()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
