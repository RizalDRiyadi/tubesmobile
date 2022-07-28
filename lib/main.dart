import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modul3/data.dart';
import 'package:modul3/firebase_options.dart';
import 'package:modul3/notif.dart';
import 'halamanutama.dart';
import 'home.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeNotifications();

  runApp( MyApp());
}

class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUser = false;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }
  @override
  Widget build(BuildContext context) {
    return ReloadApp(
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Themeset.darkMode ? Brightness.dark : Brightness.light
        ),
        title: 'hello',
        home:  SplashFirebase(),
        //Splash(isUser),

        //home: Login(),
        //home: Home(),
      ),
    );
  }

  void _initCheck() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.getBool('isUser') != null){
      setState(() {
        isUser = prefs.getBool('isUser')!;
      });
    }


    if(prefs.getBool('darkMode') != null){
      setState(() {
        Themeset.darkMode = prefs.getBool('darkMode')!;
      });
    }
    print('first load App theme = ${Themeset.darkMode}');
  }

}

class Splash extends StatefulWidget {
   final bool isUser ;
   Splash(this.isUser);


  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) =>  widget.isUser ? halamanUtama() : Login()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('load App....'),
      ),
    );
  }
}

class SplashFirebase extends StatefulWidget {
  const SplashFirebase({Key? key}) : super(key: key);

  @override
  State<SplashFirebase> createState() => _SplashFirebaseState();
}

class _SplashFirebaseState extends State<SplashFirebase> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
              if (snapshot.hasData){
                return halamanUtama();
              }else{
                return Login();
              }
          }
        )

      );

    // return MultiProvider(
    //     providers: [
    //     ChangeNotifierProvider(
    //     create: (context) => TodoListProvider(),
    // )
    // ],
    //     child: const MaterialApp(
    //       home: Home(),
    //       // body: StreamBuilder<User?>(
    //       //     stream: FirebaseAuth.instance.authStateChanges(),
    //       //     builder: (context, snapshot){
    //       //       if (snapshot.hasData){
    //       //         return Home();
    //       //       }else{
    //       //         return Login();
    //       //       }
    //       //     }
    //       // ),
    //     ),
    //
    //
    // //     providers: [
    // //     ChangeNotifierProvider(
    // //     create: (context) => TodoListProvider(),
    // // )
    // // ],
    // );
  }
}


