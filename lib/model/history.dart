class History {
  int id;
  String title;
  String details;
  DateTime eventDateUtc;

  History(this.id, this.title, this.details, this.eventDateUtc);

  // factory History.fromJson(Map<String, dynamic> json) {
  //   return History(0, '', '', DateTime.now());
  // }
}
