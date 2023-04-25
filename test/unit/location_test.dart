import 'dart:convert';
import 'dart:js_interop';
import '../../lib/models/location.dart';
import 'package:test/test.dart';
import 'package:json_annotation/json_annotation.dart';

void main() {
  test('test location desirialization', () {
    const locationJSON = {
      "name": "Arashiyama Bamboo Grove",
      "url": "https://cdn-images-1.medium.com/image.png",
      "facts": [
        {"Title": "Summary", "Text": "This bamboo grove..."}
      ]
    };

    final locationMap = json.decode(locationJSON) as Map<String, dynamic>;

    expect("Arashiyama Bamboo Grove", equals(locationMap['name']));

    final location = Location.fromJson(locationMap);
    expect(location.name, equals(locationMap['name']));
    expect(location.url, equals(locationMap['url']));
    expect(location.facts[0].title, matches(locationMap['facts'][0]['title']));
    expect(location.facts[0].text, matches(locationMap['facts'][0]['text']));
  });
}
