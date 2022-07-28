import 'package:flutter/material.dart';
import 'chatModel.dart';
import 'isiChat.dart';

class halamanChat extends StatefulWidget {
  String hallo;
  String gambar;
  halamanChat(this.hallo, this.gambar);

  @override
  State<StatefulWidget> createState() => _halamanChatState(hallo, gambar);
}

class _halamanChatState extends State<halamanChat> {
  List<chatModel> isiC = [];
  TextEditingController chatController = TextEditingController(text: '');

  String hai;
  String foto;
  String? chatAkhir;

  _halamanChatState(this.hai, this.foto);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, chatAkhir);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Color.fromARGB(255, 179, 103, 103),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(foto),
            ),
            Container(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  hai,
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.video_call)),
          IconButton(onPressed: null, icon: Icon(Icons.call)),
          IconButton(onPressed: null, icon: Icon(Icons.dark_mode)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, //untuk menjorok kekanan
          children: [
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end, // untuk chat bawah
                children: isiC
                    .map(
                      (item) => isiChat(
                    title: item.title,
                  ),
                )
                    .toList(),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 146, 131, 131),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: chatController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Ketik Pesan',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print(chatController.text);
                        setState(() {
                          isiC.add(
                            chatModel(
                              title: chatController.text,
                              selesai: false,
                            ),
                          );
                          chatAkhir = chatController.text.toString();
                          chatController.text = '';
                        });
                      },
                      child: Icon(
                        Icons.send,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}