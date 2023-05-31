import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_crew/constants/constants.dart';
import 'package:travel_crew/services/localDB.dart';
import 'package:travel_crew/services/providers.dart';
import 'package:travel_crew/views/home.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:travel_crew/views/introScreen.dart';
import 'package:travel_crew/views/login.dart';
import 'package:travel_crew/views/signup.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Client client = Client();
  client
      .setEndpoint(AppConstants.endPointId)
      .setProject(AppConstants.projectId)
      .setSelfSigned(
          status:
              true); // For self signed certificates, only use for development
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;

  bool showHome = false;

  getLoggedinState() async{
    await LocalDB.getUserId().then((value) {
      setState(() {
        if(value.toString() != "null"){
          isLogin = true;
        }
      });
    });
  }

  getShowHomeState() async{
    await LocalDB.getShowHome().then((value) {
      setState(() {
        showHome = value!;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoggedinState();
    getShowHomeState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Future.delayed(Duration(seconds: 2));
    FlutterNativeSplash.remove();
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: showHome ? (isLogin ? Home() : Login()) : IntroScreen(),
      ),
    );
  }
}
