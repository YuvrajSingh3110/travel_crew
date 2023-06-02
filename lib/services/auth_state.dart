import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:travel_crew/constants/constants.dart';
import 'package:travel_crew/services/localDB.dart';

class AuthState extends ChangeNotifier{
  Client client = Client();
  late Account account;

  AuthState(){
    _init();
  }
  _init()async{
    await client
        .setEndpoint(AppConstants.endPointId)
        .setProject(AppConstants.projectId);
    account = Account(client);
    _checkIsLoggedIn();
  }
  _checkIsLoggedIn() async {
    try {
      var res = await account.get();
      print("res");
      print(res);
    } catch (e) {
      print("error in res");
      print(e.toString());
    }
  }

  createAccount(String name, String email, String password, String uid) async {
    try {
      log(email);
      var result =
      await account.create(name: name, email: email, password: password, userId: "hello");
      await LocalDB.saveUserId(ID.custom(uid));
      print(result);
    } catch (error) {
      print(error.toString());
    }
  }

  login(String email, String password) async {
    try {
      var result =
      await account.createEmailSession(email: email, password: password);
      print("result");
      print(result);
    } catch (error) {
      print("error in result");
      print(error.toString());
    }
  }
}

