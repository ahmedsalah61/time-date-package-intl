import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dateapp(),
    );
  }
}
class Dateapp extends StatefulWidget {
  const Dateapp({super.key});

  @override
  State<Dateapp> createState() => _date_timeState();
}

class _date_timeState extends State<Dateapp> {
  String day ="";
  String weekday = "";
  String timeNow = "";

  void changeYear(){
    Timer.periodic( const Duration(seconds: 1), (timer) {
      setState(() {
        weekday = (DateFormat.EEEE().format(DateTime.now()));
        day = (DateFormat.yMMMd().format(DateTime.now()));
        timeNow = (DateFormat.jms().format(DateTime.now()));

      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeYear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: const Text("date & time today"),
          backgroundColor: Colors.blue[900]
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            Text("date today is $weekday :",style:const TextStyle(fontSize: 27,
                color: Colors.white),),
            const SizedBox(height: 10,),
            Text(day,style: const TextStyle(fontSize: 27,
                color: Colors.white),),
            const SizedBox(height: 10,),
            Text(timeNow,
              style: const TextStyle(fontSize: 27,
                  color: Colors.white),),
          ],),
      ),
    );
  }
}