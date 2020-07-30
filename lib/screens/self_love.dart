import 'package:flutter/material.dart';
import 'package:mooddiary/screens/articles.dart';

class SelfLove extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(

        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Self Love",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
      ),
      // appBar: AppBar(title:Text('Self Love'),backgroundColor: Colors.white,),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Text(
              //   'Self Love',
              //   style: TextStyle(
              //     fontFamily: 'Nunito',
              //     fontSize: 24,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 14,
                  bottom: 8,
                  top: 8,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Articles',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      
                      fontFamily: 'Nunito',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Article('The Importance of tracking your Mood',
                  Colors.lightBlue[100]),
              Article(
                  'The Top 10 Ways to Be Kind to Yourself', Colors.pink[100]),
              Article(
                'How to calm anxiety..',
                Colors.green[100],
              ),
              Article(
                'Begin with Mindful-Meditation',
                Colors.yellow[100],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
