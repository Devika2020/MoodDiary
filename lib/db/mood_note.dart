class MoodNote {
  String _timestamp;
  String _emotion;
  String _description;
  String _mediaurl;
  int _id;
  MoodNote(this._emotion, this._description, this._timestamp, this._mediaurl);

  MoodNote.map(dynamic obj) {
    this._id = obj["id"];
    this._description = obj["description"];
    this._timestamp = obj["timestamp"];
    this._emotion = obj["emotion"];
    this._mediaurl = obj["mediaurl"];
  }

  int get id => _id;
  String get description => _description;
  String get timestamp => _timestamp;
  String get emotion => _emotion;
  String get mediaurl => _mediaurl;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map["id"] = _id;
    }

    map["id"] = _id;
    map["description"] = _description;
    map["timestamp"] = _timestamp;
    map["emotion"] = _emotion;
    map["mediaurl"] = _mediaurl;
    return map;
  }

  MoodNote.fromMap(Map<String, dynamic> map) {
    this._id = map["id"];
    this._description = map["description"];
    this._timestamp = map["timestamp"];
    this._emotion = map["emotion"];
    this._mediaurl = map["mediaurl"];
  }
}
