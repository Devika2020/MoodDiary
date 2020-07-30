import 'package:flutter/material.dart';
import 'package:mooddiary/screens/input2.dart';
import 'package:intl/intl.dart';

class Input extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "HOW ARE YOU?",
              style: TextStyle(
                //color: Colors.cyanAccent[200],
                fontSize: 34,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                DateFormat.yMMMMEEEEd().format(DateTime.now()),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('rad');
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 1000),
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return Input2('Rad',
                                'assets/images/icons8-star-struck-96.png');
                          },
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child) {
                            return Align(
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Hero(
                            tag: 'Rad',
                            child: Image.asset(
                                'assets/images/icons8-star-struck-96.png')),
                        Text(
                          'Rad',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 1000),
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return Input2('Happy',
                                'assets/images/icons8-grinning-face-with-big-eyes-100.png');
                          },
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child) {
                            return Align(
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Hero(
                          tag: 'Happy',
                          child: Image.asset(
                              'assets/images/icons8-grinning-face-with-big-eyes-100.png'),
                        ),
                        Text(
                          'Happy',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 1000),
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return Input2('Meh',
                                'assets/images/icons8-face-with-rolling-eyes-100.png');
                          },
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child) {
                            return Align(
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Hero(
                          tag: 'Meh',
                          child: Image.asset(
                              'assets/images/icons8-face-with-rolling-eyes-100.png'),
                        ),
                        Text(
                          'Meh',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 1000),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return Input2('Sad',
                              'assets/images/icons8-pensive-face-100.png');
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return Align(
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                      ),
                    );
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Input2('Sad',
                    //             'assets/images/icons8-pensive-face-100.png')));
                  },
                  child: Column(
                    children: <Widget>[
                      Hero(
                          tag: 'Sad',
                          child: Image.asset(
                              'assets/images/icons8-pensive-face-100.png')),
                      Text(
                        'Sad',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 1000),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return Input2('Stressed',
                              'assets/images/icons8-fearful-face-100.png');
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return Align(
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Hero(
                          tag: 'Stressed',
                          child: Image.asset(
                              'assets/images/icons8-fearful-face-100.png')),
                      Text(
                        'Stressed',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                  Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 1000),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return Input2('Angry',
                              'assets/images/icons8-pouting-face-100.png');
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return Align(
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                      ),
                    );
                  
                  },
                  child: Column(
                    children: <Widget>[
                      Hero(tag:'Angry',child: Image.asset('assets/images/icons8-pouting-face-100.png')),
                      Text(
                        'Angry',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
