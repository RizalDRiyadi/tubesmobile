import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class kontak extends StatefulWidget {
  const kontak({Key? key}) : super(key: key);

  @override
  State<kontak> createState() => _kontakState();
}

class _kontakState extends State<kontak> {
  bool isDark = false; // variabel untuk menetukan atau merubah false true

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

  final List nama = [
    "WAHYU BUDI UTOMO",
    "FARLI NAHRUL JAVIER",
    "DEVANIS DWI SUTRISNO",
    "FARKHAN HAMZAH FIRDAUS",
    "ARIEL BAGUS ARRASYIID",
    "SALSABILA AULIA RAMADHAN",
    "NUR SYAHFEI",
    "MUHAMMAD NUR ICHSAN",
    "VIRGIAWAN SAGARMATA PATABUGA",
    "BELLA DWI MARDIANA",
    "DINDA ARINAWATI WIYONO",
    "GILLY HUGA ANARGYA",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark
          ? Color.fromARGB(255, 0, 0, 0)
          : Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          'Pilih Kontak',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
              padding: EdgeInsets.only(bottom: 15),
              alignment: Alignment.centerLeft,
              child: Row(
                // kiri kanan
                children: [
                  SizedBox(
                    width: 75,
                  ),
                  Text('12 Kontak')
                ],
              )),
          preferredSize: Size.fromHeight(10.0),
        ),
        backgroundColor: Color.fromARGB(255, 245, 4, 4),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                isDark = !isDark;
                simpanData();
                setState(() {});
              },
              icon: Icon(Icons.dark_mode)),
          IconButton(onPressed: null, icon: Icon(Icons.search)),
          IconButton(onPressed: null, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  nama[index],
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: nama.length,
      ),
    );
  }
}