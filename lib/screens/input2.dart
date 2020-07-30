import 'package:flutter/material.dart';
import 'package:mooddiary/db/database_helper1.dart';
import 'package:mooddiary/db/mood_note.dart';
import 'package:mooddiary/screens/home.dart';
import 'package:mooddiary/screens/logs.dart';

class Input2 extends StatefulWidget {
  String emotion;
  String imageurl;
  Input2(this.emotion, this.imageurl);

  @override
  _Input2State createState() => _Input2State();
}

class _Input2State extends State<Input2> {
  var db = new DataBaseHelper1();

  TextEditingController _textController = TextEditingController();
  void save(String emotion, String desc,String timestamp,String mediaurl) async {
    int res = await db.saveuser(MoodNote(emotion,desc,timestamp,mediaurl));
    // if (res != 0) {
    //   load();
    // } else {
    //   print('not saved');
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Center(
              child: Hero(
                tag: widget.emotion,
                child: Image.asset('${widget.imageurl}'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "You're Feeling",
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700,
                            fontSize: 28),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${widget.emotion}",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontStyle: FontStyle.italic,
                            fontSize: 30,
                            decoration: TextDecoration.underline,
                            //backgroundColor: Colors.lightBlueAccent,
                            color: Colors.orangeAccent[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                maxLines: 5,
                controller: _textController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                          style: BorderStyle.solid),
                    ),
                    hintText: 'Tell us what Happened!',
                    hintStyle: TextStyle(
                      fontFamily: 'Nunito',
                      fontStyle: FontStyle.italic,
                    )),
              ),
            ),
            Container(
                margin: EdgeInsets.all(15),
                child: RaisedButton(
                  onPressed: () {
String timestamp=DateTime.now().toIso8601String();

                    setState(() {
                   save(widget.emotion,_textController.text,timestamp,widget.imageurl);
                  
                    });
                    _textController.clear();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Home()));
                  },
                  color: Colors.greenAccent[400],
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
