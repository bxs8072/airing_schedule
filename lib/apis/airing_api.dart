import 'package:airing_scheduler/models/airing.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

class AiringApi {
  Client http = Client();
  static const String baseUrl = "https://animeschedule.net";
  Future<List<Map<String,List<Airing>>>> fetch({required int year, required int week}) async {
    Response response =
        await http.get(Uri.parse(baseUrl + "/?year=$year&week=$week"));

    Document document = parse(response.body);

    List<String> weeks = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];

    List<Map<String,List<Airing>>> list = [];
    for(String week in weeks) {
      list.add({
        week: document
        .querySelectorAll(
            "div.timetable-column.$week > div.timetable-column-show")
        .map(
          (doc) => Airing(
            title: doc.querySelector("a.show-link > h2")!.text.trim(),
            dateTime: DateTime.parse(doc
                .querySelector("h3.time-bar > time.show-air-time")!
                .attributes["datetime"]!),
            image: doc.querySelector("a.show-link > img")!.attributes["src"]!,
            link: doc.querySelector("a.show-link")!.attributes["href"]!,
            episode: doc
                .querySelector("h3.time-bar > span.show-episode")!
                .text
                .trim()
                .split("Ep")[1]
                .trim(),
          ),
        ).toList()
    });

    }
    return list;
  }
}
