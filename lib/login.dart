import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modul3/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  bool _isloading = false;

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _pass.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Login berhasil :)"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  void dispose(){
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: _isloading ? Center(child: Text('Wait ...'),) : Column(
          children: <Widget>[
            // TextField(
            //   controller: _email,
            //   decoration: InputDecoration(
            //     hintText: 'masukan email',
            //   ),
            // ),
            // TextField(
            //   controller: _email,
            //   decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Email',
            //       hintText: 'Enter valid email id as abc@gmail.com'),
            // ),
            // TextField(
            //   controller: _pass,
            //   decoration: InputDecoration(
            //     hintText: ' masukan Password',
            //   ),
            // ),
            // TextField(
            //
            //   obscureText: true,
            //   controller: _pass,
            //   decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Password',
            //       hintText: 'Enter secure password'),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.network('https://e7.pngegg.com/pngimages/34/887/png-clipart-online-chat-computer-icons-livechat-conversation-others-logo-online-chat.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                controller: _pass,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Login'),
              onPressed: () async {
                if (_email.text.isNotEmpty &&
                    _pass.text.isNotEmpty
                    ) {
                  signIn();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                          Text('Semua input harus Diisi !!')));
                }

              }
              //_login,
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Do you not have an Accaount ?",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Register()));
                    });
                  },
                  child: Text(
                    "Create an Account",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  // void _login() async{
  //   if(_nama.text.isNotEmpty && _pass.text.isNotEmpty){
  //     setState(() {
  //       _isloading = true;
  //     });
  //
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setBool('isUser',true);




  //     Future.delayed(Duration(seconds: 1),(){
  //       if(_nama.text == 'Doni' && _pass.text =='121'){
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Home()));
  //       }
  //     });
  //
  //
  //   }
  // }


}