import 'package:flutter/material.dart';
import 'halamanChat.dart';
import 'user.dart';

class listUser extends StatefulWidget {
  const listUser({Key? key}) : super(key: key);

  @override
  State<listUser> createState() => _listUserState();
}

class _listUserState extends State<listUser>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  String _string = "";
  String pesan = "";
  String wa = "";

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    User satu = User(
      name: 'Rizal',
      message: 'Siapa ya?',
      time: '19.00',
      image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrtBGDddGgG391gTbBKU_uUJ1z7r2q6WquCg&usqp=CAU',
    );
    User dua = User(
      name: 'Uga',
      message: 'wanna play football?',
      time: '14.30',
      image:
      'data:image/jpeg;base64,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',
    );
    User tiga = User(
        name: 'Ian ',
        message: 'Kapan? ',
        time: '21.00',
        image:
        'https://cdn.pixabay.com/photo/2017/07/25/01/22/cat-2536662_960_720.jpg');
    User empat = User(
      name: 'Doni',
      message: 'wanna play football?',
      time: '14.30',
      image:
      'data:image/jpeg;base64,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',
    );

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              final chat = await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext) =>
                      halamanChat(satu.getName(), satu.image.toString())));

              if (chat != null)
                setState(() {
                  _string = chat!;
                });
            },
            child: Container(
              width: double.infinity,
              height: 50,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(satu.image),
                    ),
                    Padding(padding: EdgeInsets.all(7)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          satu.getName(),
                          style: TextStyle(
                              color: Color.fromARGB(255, 146, 133, 133)),
                        ),
                        Text(
                          _string,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Flexible(
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 1),
                          child: Text(
                            satu.time,
                            style: TextStyle(color: Colors.grey),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final chat2 = await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext) =>
                      halamanChat(dua.getName(), dua.image.toString())));

              if (chat2 != null)
                setState(() {
                  pesan = chat2!;
                });
            },
            child: Container(
              width: double.infinity,
              height: 50,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(dua.image),
                    ),
                    Padding(padding: EdgeInsets.all(7)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dua.getName(),
                          style: TextStyle(
                              color: Color.fromARGB(255, 146, 133, 133)),
                        ),
                        Text(
                          pesan,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Flexible(
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 1),
                          child: Text(
                            dua.time,
                            style: TextStyle(color: Colors.grey),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final chat3 = await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext) =>
                      halamanChat(tiga.getName(), tiga.image.toString())));

              if (chat3 != null)
                setState(() {
                  wa = chat3!;
                });
            },
            child: Container(
              width: double.infinity,
              height: 50,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(tiga.image),
                    ),
                    Padding(padding: EdgeInsets.all(7)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tiga.getName(),
                          style: TextStyle(
                              color: Color.fromARGB(255, 146, 133, 133)),
                        ),
                        Text(
                          wa,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Flexible(
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 1),
                          child: Text(
                            tiga.time,
                            style: TextStyle(color: Colors.grey),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}