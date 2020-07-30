import 'package:flutter/material.dart';
import 'package:mooddiary/db/database_helper1.dart';
import 'package:mooddiary/db/mood_note.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
    var db = new DataBaseHelper1();
     List<MoodNote> recentMoodNotes;

  load() async {
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
      recentMoodNotes=sett;
    });
  }


    List<Map<String, Object>> get groupedMoodNoteValues {
    return List.generate(7, (index) {
      double totalSum = 0;
      final weekDay = DateTime.now().subtract(Duration(days: index));
      for (int i = 0; i < recentMoodNotes.length; i++) {
        if (recentMoodNotes[i].date.day == weekDay.day &&
            recentMoodNotes[i].date.month == weekDay.month &&
            recentMoodNotes[i].date.year == weekDay.year) {
          if (recentMoodNotes[i].amount == null) {
            recentMoodNotes[i].amount = 0;
          }
          totalSum += recentMoodNotes[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('hey'),
        ),
      );
    
  }
}
