import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> {
  String dogImageUrl = '';
  int likes = 0;
  int dislikes = 0;

  static Future<String> getRandomDogUrl() async {
    const dogEndpoint = 'https://dog.ceo/api/breeds/image/random';
    var response = await get(Uri.parse(dogEndpoint));
    return await jsonDecode(response.body)['message'];
  }

  @override
  void initState() {
    super.initState();
    // perofrm any specific initialization
    getRandomDogUrl().then((url) {
      // exit out if not mounted 
      if(!mounted) return;

      setState(() {
        dogImageUrl = url;
      });
    });
  }

  Widget _buildDogImage() {
    return GestureDetector(
      onTap: () {
        getRandomDogUrl().then((url) {
          setState(() {
            dogImageUrl = url;
            likes += 1;
          });
        });
      },
      onLongPress: () {
        getRandomDogUrl().then((url) {
          setState(() {
            dogImageUrl = url;
            dislikes += 1;
          });
        });
      },
      child: dogImageUrl.isEmpty
          ? const Text('Loading...')
          : Image.network(dogImageUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildDogImage(),
        LikeText(like: true, number: likes),
        LikeText(like: false, number: dislikes),
      ],
    );
  }
}

class LikeText extends StatelessWidget {
  /// true to render "Likes: " and false to render "Dislikes: "
  final bool like;
  final int number;

  const LikeText({this.like = true, this.number = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
      ),
      child: Row(
        children: <Widget>[
          Text(
            like ? "Likes: " : "Dislikes: ",
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('$number',
              style: const TextStyle(
                fontSize: 24.0,
              )),
        ],
      ),
    );
  }
}
