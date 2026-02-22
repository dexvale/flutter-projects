import 'package:flutter/material.dart';


void  main(){
  runApp(const gridView());
}

class gridView extends StatelessWidget {
  const gridView({super.key});
  

  @override
  Widget build(BuildContext context) {
    const Title = 'Grid List';
    return MaterialApp(
      title: Title,
      home: Scaffold(
        appBar: AppBar(title: const Text(Title),),
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(100, (index) {
            return Center(
              child: Text('Item $index', style: TextTheme.of(context).headlineSmall,),
            );
          },),
        ),
      ),
    );
  }
}