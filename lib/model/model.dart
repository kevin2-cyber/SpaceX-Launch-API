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

class Ship {
  String id;
  String name;
  String image;
  String homePort;
  String type;

  Ship({required this.id,
    required this.name,
    required this.image,
    required this.homePort,
    required this.type,});

  factory Ship.fromJson(Map<String, dynamic> json) {
    return Ship(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      homePort: json['home_port'],
      type: json['type'],
    );
  }
}
