import 'package:flutter/material.dart';
import 'package:mooddiary/screens/home.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SafeArea(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Column(
              children: <Widget>[
                Center(
                  child: Text(
                    'MOOD',
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                Container(

                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    'Keep Track of your Mood and start to Live Happy Today!',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.25,),
            Container(
              //alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.1),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                  ),
                  Text(
                    'Get started',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
