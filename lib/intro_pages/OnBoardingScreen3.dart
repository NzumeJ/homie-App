import 'package:flutter/material.dart';
import 'package:homie/All logins/login.dart';



class OnBoardingScreen3Page extends StatefulWidget {
  const OnBoardingScreen3Page({Key? key}) : super(key: key);

  @override
  _OnBoardingScreen3PageState createState() => _OnBoardingScreen3PageState();
}

class _OnBoardingScreen3PageState extends State<OnBoardingScreen3Page> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'SKip',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          toolbarHeight: 100,
        ),


        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Padding(
              //  padding: const EdgeInsets.only(bottom: 10.0),
              //child: Container(
              // child: IconButton(
              //  icon: Icon(Icons.arrow_back),
              // color: Colors.white,

              // onPressed: () {
              // Navigator.pop(context,'/onboarding_screen_4.dart');
              //print('IconButton pressed');
              // },
              // ),
              // ),
              //  ),


              Container(
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.only(top: 0.0, right: 30.0, left: 20),
                child: Center(
                  child: Text(
                    'Save Money With Us',
                    style: TextStyle(fontSize: 36, color: Colors.white),
                  ),
                ),
              ),



              Container(
                //color: Colors.lightBlueAccent,
                padding: EdgeInsets.only(top: 159.0, left: 240.0),
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.white,
                  child: ElevatedButton(
                    //onPressed: (){
                      //Navigator.push(context, MaterialPageRoute(builder:
                        //  (context) => Scaffold()
                      //),
                      //);
                   // },

                    child: Text('Get Started'),

                    //color: Colors.deepOrange,
                    //color: Color.alphaBlend(Colors.deepOrange, Colors.white),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => LoginPage(),
                        ),
                      );// Add your forgot password logic here
                    },
                  ),
                ),
              ),
              //SizedBox(height: 2),



              //Spacer(),
              Image.asset(
                'lib/assets/images/House searching-pana.png',
                width: double.infinity,
                fit: BoxFit.cover,

              ),




            ],
          ),
        ),
      ),
    );
  }
}