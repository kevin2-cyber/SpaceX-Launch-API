class History {
  int id;
  String title;
  String details;
  DateTime eventDateUtc;

  History({required this.id, required this.title, required this.details, required this.eventDateUtc});

  History copyWith({required String title, required String details, required DateTime eventDateUtc}) {
    return History(
        id: id,
        title: title,
        details: details,
        eventDateUtc: eventDateUtc
    );
  }

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['id'],
      title: json['title'],
      details: json['details'],
      eventDateUtc: json['event_date_utc']
    );
  }
}
