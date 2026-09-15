import 'dart:convert'; // needed to encode/decode JSON
import 'package:http/http.dart' as http; // needed to make HTTP requests (third-party pkg)
                                         // to install a new package, "dart pub add {package}"

// API constants first
String API_BASE_URL = 'http://freedictionaryapi.com/api/v1';

// I'm choosing to make separate constants for endpoints, pretending that this application
// would grow in complexity.

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
  final url = Uri.parse(urlString);
  // 2. make HTTP request & get response
  final response = await http.get(url); // all the http package get/post/etc. functions are async
                                        // so I need to await the result
  // 3. return JSON
  return jsonDecode(response.body);
}

Future<String> getWordDefinition(String word) async {
  // this function must also be async, because getJSON() is async!

  // 1. compose the word into the url string (base url + endpoint + word)
  String urlString = '${API_BASE_URL}/entries/en/${word}';

  // 2. fire getJSON and collect the result
  var jsonData = await getJSON(urlString);

  // 3. navigate through the shape of the data and return the definition
  return jsonData['entries'][0]['senses'][0]['definition'];
}
