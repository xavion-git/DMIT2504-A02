import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

///TODO: create a stateful widget, override initState to fetch the initial
/// dog url. NOTE: will need to ensure a callback is used to be certain the
/// widget has been mounted before calling setState().
Future<void> main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: RandomDogImage(),
        ),
      ),
    );
  }
}

// skeleton of ingredients for a stateful widget/component
// (yes, way more annoying to set up than in React)

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}


class _RandomDogImageState extends State<RandomDogImage> {

  String dogImageUrl = '';

  static Future<String> getRandomDogUrl() async {
    const dogEndpoint = 'https://dog.ceo/api/breeds/image/random';
    var response = await get(Uri.parse(dogEndpoint));
    return await jsonDecode(response.body)['message'];
  }

  // refactor dog image fetching into its own function, so i can reuse it
  Future<void> fetchNewDog() async {

    setState(() { dogImageUrl = ''; });  // reset the dog URL state first

    final url = await getRandomDogUrl(); // get new dog image URL

    if (!mounted) return;                // bail out if component isn't mounted into element tree

    setState(() { dogImageUrl = url; }); // overwrite dog image state

  }

  @override
  void initState() {
    super.initState();    
    fetchNewDog();
  }

  @override
  Widget build(BuildContext context) {
    // ternary gang: conditionally return loading text OR dog image
    return dogImageUrl.isEmpty
      ? const Text("Loading dog...")
      : Image.network(dogImageUrl);

  }

}

//   @override
//   Widget build(BuildContext context) {
//     return Image.network();
//   }
// }
