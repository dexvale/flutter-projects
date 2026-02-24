import 'package:flutter/material.dart';

void main() {
  runApp(const SpaceItemsList());
}

class SpaceItemsList extends StatelessWidget {
  const SpaceItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    const items = 10;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        cardTheme: CardThemeData(color: Colors.blue.shade50),
      ),
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(items, (index) => ItemWidget(text: 'Items $index',)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(height: 100, child: Center(child: Text(text),),),
    );
  }
}
