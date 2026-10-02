import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.pink,
      brightness: Brightness.dark,
    );

    return MaterialApp(
      theme: ThemeData(
        colorScheme: colorScheme,
        // in class, we talked about considering the difference between e.g.
        // directly using the primary colour vs. e.g. primaryContainer, onPrimary, etc.
        // and this helps illustrate why it's important to specifically consider those things.
        scaffoldBackgroundColor: colorScheme.primaryContainer, // try changing back to .primary — yuck!
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontFamily: "Playwrite BE WAL Guides",
            fontSize: 44,
            color: colorScheme.primary,
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: colorScheme.secondary,
          ),
        ),
      ),
      home: const RecipePage(),
    );
  }
}


class RecipePage extends StatelessWidget {

  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {

    final border = BorderSide(
      color: Theme.of(context).colorScheme.primary,
      width: 6,
    );

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // like a flexbox!
                            // .stretch alignment means children fill the entire width
        children: [

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'My Recipe App',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),

          Container(
            decoration: BoxDecoration(
              border: Border(top: border, bottom: border),
            ),
            child: Image.asset(
              'assets/images/cool.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  ListWithHeading(
                    heading: "Ingredients",
                    listItems: [
                      "- some ingredient",
                      "- some ingredient",
                      "- some ingredient",
                      "- some ingredient",
                      "- some ingredient",
                    ]
                  ),
                  ListWithHeading(
                    heading: "Instructions",
                    listItems: [
                      '1. take your cream and behold it',
                      '2. whip it good',
                      '3. dip a strawberry',
                    ]
                  ),

                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// I notice that the Ingredients & Instructions 'shapes' are identical,
// so I can make one component to reuse for both those purposes.
class ListWithHeading extends StatelessWidget {
  // 1. I need a constructor (input params: super.key, heading, and list<str>)
  const ListWithHeading({
    super.key,
    required this.heading,
    required this.listItems,
  });

  // 2. I need class attributes for heading & items
  final String       heading;
  final List<String> listItems;


  // 3. I need to write a build method that returns that group of elements
  @override
  Widget build(BuildContext context) {
    // I basically just take what I had inline and paste it here
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // default x-axis align will be centering
        children: [
          Text(
            heading,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          for (final item in listItems) Text(item),
        ],
      ),
    );
  }
}
