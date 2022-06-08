class Airing {
  final String title;
  final DateTime dateTime;
  final String image;
  final String link;
  final String episode;

  Airing({
    required this.title,
    required this.dateTime,
    required this.image,
    required this.link,
    required this.episode,
  });

  Map<String, dynamic> get toMap => {
    "title": title,
    "datetime": dateTime,
    "image": image,
    "link": link,
    "episode": episode,
  };
}
