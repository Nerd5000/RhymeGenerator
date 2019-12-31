import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:clipboard_manager/clipboard_manager.dart';

String searchWord;

class Home extends StatefulWidget {
  static String searchWord='hello';
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  String api = 'https://rhymebrain.com/talk?function=getRhymes&word=$searchWord';
  var res, words;


  @override
  void initState() {
    super.initState();
    fetchData();
  }
  
  fetchData() async {
    res = await get(api);
    words = jsonDecode(res.body);
    print(words.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Test'),backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.white70,
      body: Center ( child : res != null ? ListView.builder(
        itemCount: words.length,
        itemBuilder: (context,index){
          var word =words[index]['word'];
          return ListTile(
            leading:Icon(Icons.content_copy) ,
            title: Text(word),
            onTap: (){
              ClipboardManager.copyToClipBoard(word);
            },
          );
        },
      ) : CircularProgressIndicator(backgroundColor: Colors.white),), 
    );
  }
}