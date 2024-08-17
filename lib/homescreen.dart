import 'package:alaram_clockapp/addalaram.dart';
import 'package:alaram_clockapp/alramPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddAlarm()),);
        },
        child: Icon(Icons.add,size:40,color:Colors.blue),
        backgroundColor: Colors.grey[200], 
        shape: CircleBorder(), 
  elevation: 6.0, 
      ),
      
  

      body:SafeArea(
        child: Container(
          
          alignment: Alignment.center,
          color:Colors.white
        ,
          child:Alrampage()),
      ),

    );
  }
}