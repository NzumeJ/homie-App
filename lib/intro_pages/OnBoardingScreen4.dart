import 'package:flutter/material.dart';
import 'package:homie/intro_pages/OnBoardingScreen1.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/binding.dart';




class OnBoardingScreen4Page extends StatefulWidget {
  const OnBoardingScreen4Page({Key? key}) : super(key: key);

  @override
  _OnBoardingScreen4PageState createState() => _OnBoardingScreen4PageState();
}

 class _OnBoardingScreen4PageState extends State<OnBoardingScreen4Page> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.blue,

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => OnBoardingScreen1Page(),
              ),
            );
          },
          child: Text('NEXT'),
        ),
      ),
    );

  }
}
