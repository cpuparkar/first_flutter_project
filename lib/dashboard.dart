import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(onPressed: (){
        count++;
        setState(() {
          
        });
      }),
appBar: AppBar(
  //backgroundColor: Color.fromARGB(0, 61, 71, 213),
  title: Text("My First App12345"),
  backgroundColor: const Color.fromARGB(255, 82, 126, 140)
),

body: Center(child: Text("You have pressed this button\n$count")),

    
  );}
}