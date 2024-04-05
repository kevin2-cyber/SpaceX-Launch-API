class History {
  String id;
  String title;
  String details;
  DateTime eventDateUtc;

  History({required this.id, required this.title, required this.details, required this.eventDateUtc});

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['id'],
      title: json['title'],
      details: json['details'],
      eventDateUtc: DateTime.parse(json['event_date_utc'])
    );
  }
}
