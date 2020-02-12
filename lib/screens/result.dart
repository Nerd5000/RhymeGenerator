import 'package:flutter/material.dart';
import 'package:rhyme_generator/services/network.dart';
import 'package:clipboard_manager/clipboard_manager.dart';

String searchWord;

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  Networking networking = Networking(
      url: 'https://rhymebrain.com/talk?function=getRhymes&word=$searchWord');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results'), backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.white70,
      body: Center(
          child: FutureBuilder(
        future: networking.getRequest(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var word = snapshot.data[index]['word'];
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Icon(Icons.content_copy),
                    title: Text(word),
                    onTap: () {
                      ClipboardManager.copyToClipBoard(word);
                    },
                  ),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(backgroundColor: Colors.white);
          }
        },
      )
          // ListView.builder(
          //     itemCount: words.length,
          //     itemBuilder: (context, index) {
          //       var word = words[index]['word'];
          //       return ListTile(
          //         leading: Icon(Icons.content_copy),
          //         title: Text(word),
          //         onTap: () {
          //           ClipboardManager.copyToClipBoard(word);
          //         },
          //       );
          //     },
          //   )
          // CircularProgressIndicator(backgroundColor: Colors.white),
          ),
    );
  }
}
