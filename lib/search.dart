import 'package:flutter/material.dart';
import 'package:rhyme_generator/home.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar :AppBar(backgroundColor:Colors.blueGrey),
      backgroundColor: Colors.white70,
      body : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 70,),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter a search term'
              ),
              onChanged: (text){
                setState(() {
                  searchWord = text;    
                  print(text);
                },);
              },
            ),
            SizedBox(height: 70,),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                        
              },
              child: Text(
              'Search',
              style: TextStyle(fontSize: 20)
              ),
          ),
          ],
        ),
      ),
    );
  }
}