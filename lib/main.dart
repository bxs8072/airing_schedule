import 'package:airing_scheduler/apis/airing_api.dart';

void main() {
  AiringApi().fetch(
    week: 24,
    year: 2022,
  ).then((value) {
    for (var element in value) { 
      element.forEach((key, value) { 
        print(key + ": ");
        value.forEach((element) { 
          print(element.toMap);
        });
      });
    }
  });
}


