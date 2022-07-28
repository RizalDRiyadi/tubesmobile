import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  bool _isloading = false;

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text.trim(), password: _pass.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Akun telah dibuat gaesss "),
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
      appBar: AppBar(title: Text('Buat Akun'),),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: _isloading ? Center(child: Text('Wait ...'),) : Column(
          children: <Widget>[
            TextField(
              controller: _email,
              decoration: InputDecoration(
                hintText: 'masukan email',
              ),
            ),
            TextField(
              controller: _pass,
              decoration: InputDecoration(
                hintText: ' masukan Password',
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
                child: Text('Daftar'),
                onPressed: () async {
                  if (_email.text.isNotEmpty &&
                      _pass.text.isNotEmpty
                  ) {
                    signUp();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                            Text('Semua input harus Diisi !!')));
                  }

                }
              //_login,
            )
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