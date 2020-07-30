import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mooddiary/db/database_helper1.dart';
import 'package:mooddiary/db/mood_note.dart';
import 'package:table_calendar/table_calendar.dart';

class Identify extends StatefulWidget {
  @override
  _IdentifyState createState() => _IdentifyState();
}

class _IdentifyState extends State<Identify> {
  CalendarController _calendarController;
  var db = new DataBaseHelper1();

  List<MoodNote> todayy = [];
  List<MoodNote> todayList = [];
  List<MoodNote> selectedDay = [];
  List<MoodNote> selectedDayList = [];
  bool isDaySelected = false;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    l2(DateTime.now().toIso8601String());
  }

//   void load1() async {
//     List a = await db.getallusers();
//     List<MoodNote> abc = [];
//     for (int i = 0; i < a.length; i++) {
//       abc.add(MoodNote(
//         MoodNote.fromMap(a[i]).emotion,
//         MoodNote.fromMap(a[i]).description,
//         MoodNote.fromMap(a[i]).timestamp,
//         MoodNote.fromMap(a[i]).mediaurl,
//       ));
//     }
//     for (int j = 0; j < abc.length; j++) {
//       if (DateTime.parse(abc[j].timestamp).year != DateTime.now().year) {
//         continue;
//       } else if (DateTime.parse(abc[j].timestamp).month !=
//           DateTime.now().month) {
//         continue;
//       }
//       //  DateTime.parse(abc[j].timestamp).
// // Duration z = DateTime.parse(abc[j].timestamp).difference(DateTime.now());
// //  DateTime m=DateTime.parse(abc[j].timestamp).add(z);

//       if (DateTime.now().day == DateTime.parse(abc[j].timestamp).day) {
//         // print(m.day);
//         todayy.add(abc[j]);
//       }
//     }
//     setState(() {
//       todayList = todayy;
//     });
//   }
  ///separation
  void l2(String selectedDate) async {
    // setState(() {
    //   isDaySelected=true;
    // });
    List a = await db.getallusers();
    List<MoodNote> abc = [];
    for (int i = 0; i < a.length; i++) {
      abc.add(MoodNote(
        MoodNote.fromMap(a[i]).emotion,
        MoodNote.fromMap(a[i]).description,
        MoodNote.fromMap(a[i]).timestamp,
        MoodNote.fromMap(a[i]).mediaurl,
      ));
    }
    for (int j = 0; j < abc.length; j++) {
      if (DateTime.parse(abc[j].timestamp).year !=
          DateTime.parse(selectedDate).year) {
        continue;
      } else if (DateTime.parse(abc[j].timestamp).month !=
          DateTime.parse(selectedDate).month) {
        continue;
      }
      //  DateTime.parse(abc[j].timestamp).
// Duration z = DateTime.parse(abc[j].timestamp).difference(DateTime.now());
//  DateTime m=DateTime.parse(abc[j].timestamp).add(z);

      if (DateTime.parse(selectedDate).day ==
          DateTime.parse(abc[j].timestamp).day) {
        // print(m.day);
        selectedDay.add(abc[j]);
      }
    }
    setState(() {
      selectedDayList = selectedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
         appBar: AppBar(

        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Mood",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              fontSize: 18),
        ),
      ),
      body: Column(
        children: <Widget>[
          TableCalendar(
            initialCalendarFormat: CalendarFormat.week,
            calendarController: _calendarController,
            calendarStyle: CalendarStyle(
              todayColor: Colors.blue.withOpacity(0.5),
              selectedColor: Colors.deepPurple[200],
              todayStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            headerStyle: HeaderStyle(
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              centerHeaderTitle: true,
              formatButtonDecoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              formatButtonTextStyle: TextStyle(color: Colors.white),
              formatButtonShowsNext: false,
            ),
            startingDayOfWeek: StartingDayOfWeek.monday,
            // onCalendarCreated: (date,a,b){print(date);
            //   acc(date);},

            onDaySelected: (date, events) {
              setState(() {
                selectedDayList.clear();
              });
              print(date.toString());
              l2(date.toIso8601String());
            },
          ),
          Expanded(
            child: (selectedDayList.length == 0)
                ? Center(
                    child: Text("No Content!",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Nunito',
                        )),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 1,
                              color: Colors.grey,
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.lightBlue[50],
                        ),
                        margin: EdgeInsets.only(
                          left: 8,
                          right: 8,
                          top: 4,
                          bottom: 4,
                        ),
                        child: ListTile(
                          //dense: true,
                          // leading: isSearched?Image.asset(searchList[index].mediaurl):Image.asset(e[index].mediaurl),
                          leading: Image.asset(selectedDayList[index].mediaurl),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    // isSearched?DateFormat.yMEd()
                                    //     .format(DateTime.parse(searchList[index].timestamp)):DateFormat.yMEd()
                                    //     .format(DateTime.parse(e[index].timestamp)),
                                    DateFormat.yMEd().format(DateTime.parse(
                                        selectedDayList[index].timestamp)),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                  Text("   "),
                                  Text(
                                    // isSearched?DateFormat.Hms()
                                    //     .format(DateTime.parse(searchList[index].timestamp)):
                                    // DateFormat.Hms()
                                    //     .format(DateTime.parse(e[index].timestamp)),
                                    DateFormat.Hms().format(DateTime.parse(
                                        selectedDayList[index].timestamp)),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                              Text(
                                // isSearched?searchList[index].emotion:
                                // e[index].emotion,
                                selectedDayList[index].emotion,
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            // isSearched?searchList[index].description:
                            // e[index].description,
                            selectedDayList[index].description,
                            style: TextStyle(fontFamily: 'Nonito'),
                          ),
                          // trailing: IconButton(
                          //   icon: Icon(Icons.delete,
                          //       color: Colors.red.withOpacity(0.8)),
                          //   onPressed: () async {
                          //     int a = await db
                          //         .deleteUser(MoodNote.fromMap(s[index]).id);
                          //     if (a == 1) {
                          //       setState(() {
                          //         e.removeAt(index);
                          //         load();
                          //       });
                          //     } else {
                          //       print('not deleted');
                          //     }
                          //   },
                          // ),
                        ),
                      );
                    },
                    itemCount: selectedDayList.length,
                  ),
          ),
        ],
      ),
      ),
    );
  }
}
