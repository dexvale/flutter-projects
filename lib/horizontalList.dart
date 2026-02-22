import 'package:flutter/material.dart';



class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Horizontal list';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: const Text(title),),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 200,
          child: ScrollConfiguration(
            behavior: const MaterialScrollBehavior().copyWith(), 
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (final color in Colors.primaries)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(width: 160, color: color),
                )
              ],
            )
            ),
        ),
      ),
    );
  }
}

