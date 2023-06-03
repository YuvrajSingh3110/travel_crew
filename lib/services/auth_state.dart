import 'package:appwrite/appwrite.dart';
import 'package:travel_crew/constants/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_crew/services/localDB.dart';

class AuthState extends ChangeNotifier {
  Client client = Client();
  late final Account account;

  AuthState() {
    _init();
    _checkIsLoggedIn();
  }

  _init() {
    client
        .setEndpoint(AppConstants.endPointId)
        .setProject(AppConstants.projectId)
        .setSelfSigned();
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

  createAccount({required String name, required String email, required String password}) async {
    try {
      String id = ID.unique();
      print("id");
      print(id);
      var result = await account.create(
          name: name, email: email, password: password, userId: id);
      await LocalDB.saveUserId(id.toString());
      print(result);
    } catch (error) {
      print("Error in creating account");
      print(error.toString());
    }
  }


  login({required String email, required String password}) async {
    try {
      final result =
          await account.createEmailSession(email: email, password: password);
      return result;
      // print("result");
      // print(result);
    } catch (error) {
      print("error in result");
      print(error.toString());
    }
  }
}

