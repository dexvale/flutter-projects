import 'package:flutter/material.dart';

void main(){
  runApp(const Spotify());
}

class Spotify extends StatelessWidget {
  const Spotify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Good Afternoon', style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),),
                     IconButton(
                      icon: Icon(Icons.settings, color: Colors.white,), 
                      onPressed: () {},
                      )
                  ],
                ),

                
              ],
            ),
          ),
        ),
      ),
    );
  }
}