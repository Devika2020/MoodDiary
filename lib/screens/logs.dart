import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mooddiary/db/database_helper1.dart';
import 'package:mooddiary/db/mood_note.dart';
import 'package:mooddiary/screens/input.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

class Logs extends StatefulWidget {
  @override
  _LogsState createState() => _LogsState();
}

class _LogsState extends State<Logs> {
  TextEditingController _textC = TextEditingController();
  List<MoodNote> e = [];
  List s = [];
  List<MoodNote> searched = [];
  List<MoodNote> searchList = [];
  bool isSearched = false;
  var db = new DataBaseHelper1();
  Future<List> load() async {
    List a = await db.getallusers();
    List<MoodNote> sett = [];
    for (int i = 0; i < a.length; i++) {
      sett.add(MoodNote(
        MoodNote.fromMap(a[i]).emotion,
        MoodNote.fromMap(a[i]).description,
        MoodNote.fromMap(a[i]).timestamp,
        MoodNote.fromMap(a[i]).mediaurl,
      ));
    }

    setState(() {
      e = sett;
      s = a;
    });
  }

  getColumnData() {
    return e;
  }
  // void acc(DateTime t) {
  //   for (int i = 0; i < e.length; i++) {
  //     Duration z = DateTime.parse(e[i].timestamp).difference(t);

  //     if (z.inDays == 0) {
  //       selected.add(e[i]);
  //       print(e[i].emotion);
  //     }
  //   }
  // }

  @override
  void initState() {
    load();

    super.initState();
  }

  Future<List> handleSearch(String query) async {
    print(query);
    setState(() {
      isSearched = true;
      searched = [];
      searchList = [];
    });
    List m = await db.searchQuery(query);
    for (int i = 0; i < m.length; i++) {
      searched.add(MoodNote(
          MoodNote.fromMap(m[i]).emotion,
          MoodNote.fromMap(m[i]).description,
          MoodNote.fromMap(m[i]).timestamp,
          MoodNote.fromMap(m[i]).mediaurl));
    }
    setState(() {
      searchList = searched;
    });
    print(searchList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.lightBlue[100],
floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat ,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink[100],
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Input()));
          }),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: false,
              controller: _textC,
              onFieldSubmitted: (q) {
                handleSearch(q);
              },
              decoration: InputDecoration(
                hintText: "   Search for an Mood...",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
                //filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[350],
                  size: 30,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _textC.clear();
                    setState(() {
                      isSearched = false;
                    });
                  },
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: FlatButton(
                
            //     child: Text('How are you Feeling?  >',style: TextStyle(fontStyle:FontStyle.italic,fontFamily:'Nunito',),),
            //     color: Colors.lightBlue[100],
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(15.0),
            //       side: BorderSide(
            //        color: Colors.blue,
            //       ),
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //           context, MaterialPageRoute(builder: (context) => Input()));
            //     },
            //   ),
            // ),
            //Chart started
            // Container(
            //   child: SfCartesianChart(
            //     primaryXAxis: CategoryAxis(),
            //     primaryYAxis: NumericAxis(),
            //     series: <ChartSeries>[

            //       ColumnSeries<MoodNote,String>(
            //           dataSource: getColumnData(), xValueMapper: (MoodNote note,_)=>note.timestamp, yValueMapper: (MoodNote note,_)=>note.emotion,);
            //     ],
            //   ),
            // ),
            //Chart over
            // TextField(
            //   controller: _textC,
            //   autofocus: false,
            //   decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(
            //           10,
            //         ),
            //       ),
            //       fillColor: Colors.grey[300],
            //       hintText: 'Search an entry',
            //       hintStyle: TextStyle(fontSize: 15, fontFamily: 'Nunito,')),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 10,
                  ),
                  child: Text(
                    'Mood Entries',
                    //textAlign: TextAlign.start,
                    style: TextStyle(
                      //color: Colors.purple[900],
                      fontSize: 23,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 7),
              child: Divider(
                color: Colors.grey,
                thickness: 0.0,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
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
                      top: 6,
                      bottom: 6,
                    ),
                    child: ListTile(
                      //dense: true,
                      leading: isSearched
                          ? Image.asset(searchList[index].mediaurl)
                          : Image.asset(e[index].mediaurl),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                isSearched
                                    ? DateFormat.yMEd().format(DateTime.parse(
                                        searchList[index].timestamp))
                                    : DateFormat.yMEd().format(
                                        DateTime.parse(e[index].timestamp)),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                              Text("   "),
                              Text(
                                isSearched
                                    ? DateFormat.Hms().format(DateTime.parse(
                                        searchList[index].timestamp))
                                    : DateFormat.Hms().format(
                                        DateTime.parse(e[index].timestamp)),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ],
                          ),
                          Text(
                            isSearched
                                ? searchList[index].emotion
                                : e[index].emotion,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        isSearched
                            ? searchList[index].description
                            : e[index].description,
                        style: TextStyle(fontFamily: 'Nonito'),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle,
                            color: Colors.red.withOpacity(0.8)),
                        onPressed: () async {
                          int a = await db
                              .deleteUser(MoodNote.fromMap(s[index]).id);
                          if (a == 1) {
                            setState(() {
                              e.removeAt(index);
                              load();
                            });
                          } else {
                            print('not deleted');
                          }
                        },
                      ),
                    ),
                  );
                  // return MoodNoteTile(e[index].emotion, e[index].mediaurl, e[index].description, e[index].timestamp);
                },
                itemCount: isSearched ? searchList.length : e.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MoodNoteTile extends StatefulWidget {
//   String timestamp;
//   String emotion;
//   String description;
//   String mediaurl;
//   MoodNoteTile(this.emotion, this.mediaurl, this.description, this.timestamp);

//   @override
//   _MoodNoteTileState createState() => _MoodNoteTileState();
// }

// class _MoodNoteTileState extends State<MoodNoteTile> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListTile(
//         leading: Image.asset(widget.mediaurl),
//         title: Column(
//           children: <Widget>[
//             Text(
//               DateFormat.yMMMMEEEEd().format(DateTime.parse(widget.timestamp)),
//             ),
//             Text(widget.emotion),
//           ],
//         ),
//         subtitle: Text(widget.description),
//         trailing:IconButton(
//                       icon: Icon(Icons.delete, color: Colors.red),
//                       onPressed: (){}
//                     ),
//       ),
//     );
//   }
// }
