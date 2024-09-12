import 'package:flutter/material.dart';
import 'package:homie/All logins/login.dart';
import 'package:homie/All logins/ForgotPassword1.dart';
import 'NavBar.dart';
import 'package:homie/hostel_properties/hostel_properties.dart';




class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
        ),
        toolbarHeight: 170,
      ),


      body: Padding(
        padding: const EdgeInsets.only(top: 140.0),
        child: Center(
          child: Column(
          children: [

          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => ForgotPassword1Page(),
                  ),
                );
              },
              //prefixIcon: Icon(Icons.password),
              child: const Text('Change Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 25),
                backgroundColor: Colors.white,

              ),
            ),
          ),

            SizedBox(height: 50,),

            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => ForgotPassword1Page(),
                    ),
                  );
                },
                //prefixIcon: Icon(Icons.password),
                child: const Text('Night Mode',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 25),
                  backgroundColor: Colors.white,

                ),
              ),
            ),

            SizedBox(height: 50,),

            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => LoginPage(),
                    ),
                  );
                },
                //prefixIcon: Icon(Icons.password),
                child: const Text('Log-Out',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 25),
                  backgroundColor: Colors.white,


                ),
              ),
            ),
        ],
            ),

        ),
      ),


      bottomNavigationBar: Navbar(),

    );
  }
}

