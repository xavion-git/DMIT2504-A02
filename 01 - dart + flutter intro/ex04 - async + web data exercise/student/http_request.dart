import 'dart:convert'; // for jsonDecode()
import 'package:http/http.dart' as http; // for http requests

// API COnstants first 
String API_BASE_URL = 'https://freedictionaryapi.com/api/v1/entries/en/';


// I need a function that:
//  - takes a string input (word lookup)
//  - places it into the base string for the dictionary API
//  - generates a new Uri instance for that URL
//  - makes an http GET request to that URL (need dart:http library)
//  - attempts to decode the body of that response into JSON & returns that data
//
//  This is definitely a lot of words for some fairly 'simple' code... what would this look like in JavaScript?
//     const data = fetch(myURL).then(r => r.json());
//
//  but in Dart, we have to do a lot of those steps manually, especially because it's a strongly typed language.

// I have two options: I can make a generic function to request from a URL and parse JSON,
//                     or I can make a specific function to take a word and return its definition
//                     (with all the API interaction inside that). Let's do the first option, since it's reusable for any case.
Future<dynamic> getJSON(String urlString) async {
  // We want all our HTTP interaction to be async, so we return a Future<someType>,
  // and valid JSON can start with a variety of data types, so we use the "dynamic" type
  // to tell the compiler it could be anything.

  // 1. parse URL string as Uri
  final Uri url = Uri.parse(urlString);
  // 2. make HTTP request & get response
  final response = await get(url); // all the http package get/post/etc. functions are async, so we must await them
  // 3. return JSON

  return jsonDecode(response.body);  
}


Future<String> getDictionaryDefinition(String word) async {
  // this function must also be async, because getJSON() is async!
  String endpoint = '$API_BASE_URL$word';
  return await getJSON(endpoint);
}

void main() {
  print("What's the word you wan to look up?");
  String word = stdin.readLinSync()!;

  String dummyResult = getJSON(word)
}
