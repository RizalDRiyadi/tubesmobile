


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class list extends StatefulWidget {

  @override
  State<list> createState() => _listState();

}

class _listState extends State<list> {
  final List bulan = [
    "Januari",
    "Fabruari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];
  @override
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar( title: Text("hello")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(

                title: Text(
                    bulan[index],
                    style: TextStyle(fontSize: 30)
                ),
                subtitle: Text('ini subtitle dari ' + bulan[index]),
                leading: CircleAvatar(
                  child: Text(
                    bulan[index][0], // ambil karakter pertama text
                    style: TextStyle(fontSize: 20)
                ),
            ),
            ),
          );
        },
        itemCount: bulan.length,
      ),
    );
  }
}
