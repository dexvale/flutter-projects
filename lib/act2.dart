import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

final TextEditingController inputValue = TextEditingController();
String name = '';
double num = 0.0;
double sum= 0.0;
String? errorMessage;




void showData(){
   final finalValue = double.tryParse(inputValue.text);
   double add =  5.0;

  if(finalValue != null){
    errorMessage = "Please enter character only";
  }else{
    errorMessage = null;
  }

   setState(() {
    name =  inputValue.text;
   });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Output: $name'),
            TextField(
              controller: inputValue,
              decoration: InputDecoration(
                label: Text('Enter'),
                border: OutlineInputBorder(),
                constraints: BoxConstraints(
                  maxWidth: 200
                )
              ),
            ),
            if(errorMessage !=  null)
          Text(errorMessage!, style: TextStyle(color: Colors.redAccent)),
            ElevatedButton(
              onPressed: showData, 
              child: Text('Submit')
              )
          ],
        ),
      ),
    );
  }
}