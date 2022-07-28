import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'kontak.dart';
import 'listUser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth.dart';
import 'kontak.dart';

class halamanUtama extends StatefulWidget {
  const halamanUtama({Key? key}) : super(key: key);

  @override
  State<halamanUtama> createState() => _HomescreenState();
}

class _HomescreenState extends State<halamanUtama>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  bool isDark = false; // variabel untuk menetukan atau merubah false true

  void valuee() async {
    //login
    final prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('nama');
    final String? nim = prefs.getString('nim');

    setState(() {
      namaAslab = name.toString();
      nimAslab = nim.toString();
    });
  }

  String namaAslab = "";
  String nimAslab = "";

  simpanData() async {
    // dark
    final tombol = await SharedPreferences.getInstance();
    await tombol.setBool('isDark', isDark);
  }

  getLocalData() async {
    final tombol = await SharedPreferences.getInstance();
    isDark = tombol.getBool('isDark') ?? false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    valuee();
    getLocalData();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark
          ? Color.fromARGB(255, 0, 0, 0)
          : Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          'Chatting',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 179, 103, 103),
        actions: <Widget>[
          IconButton(onPressed: null, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                isDark = !isDark;
                simpanData();
                setState(() {});
              },
              icon: Icon(Icons.dark_mode)),
          IconButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.remove("login");
                prefs.remove("id");
                prefs.remove("nama");
                prefs.remove("nim");
                prefs.remove("username");
                prefs.remove("password");

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext) => Login()));
              },
              icon: Icon(Icons.login)),
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(
              text: "Login",
            ),
            Tab(
              text: "Chat",
            ),
            Tab(
              text: "Story",
            ),
            Tab(
              text: "Calls",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          Text("\n$namaAslab \n$nimAslab",
              style: TextStyle(fontSize: 18, color: Colors.grey)),
          listUser(),
          Text("Story", style: TextStyle(fontSize: 15, color: Colors.grey)),
          Text("Calls", style: TextStyle(fontSize: 15, color: Colors.grey)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 240, 125, 125),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => kontak()),
          ),
        },
        child: const Icon(Icons.comment, color: Colors.white),
      ),
    );
  }
}