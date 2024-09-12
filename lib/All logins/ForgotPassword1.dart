import 'package:flutter/material.dart';
import 'package:homie/All logins//ForgotPassword2.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ForgotPassword1 Page',
      home: const ForgotPassword1Page(),
    );
  }
}

class ForgotPassword1Page extends StatefulWidget {
  const ForgotPassword1Page({Key? key}) : super(key: key);

  @override
  _ForgotPassword1PageState createState() => _ForgotPassword1PageState();
}

class _ForgotPassword1PageState extends State<ForgotPassword1Page> {
  final TextEditingController _emailController = TextEditingController();


  void _login() {
    // Add your authentication logic here
    String email = _emailController.text;

    print('Email: $email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'FORGOT PASSWORD',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
        ),
        toolbarHeight: 100,
      ),


      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 0),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                  child: Image(
                    image: AssetImage('lib/assets/images/Reset password-pana.png'), // Replace with your image asset
                    height: 250,
                    width: double.infinity,
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text('Enter your email to reset your password'),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(right: 250.0),
                child: Text(
                    'Email'),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'info@gmail.com',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: 7),
              ),
          
              const SizedBox(height: 10),
          
              const SizedBox(height: 10),
          
              const SizedBox(height: 200),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => ForgotPassword2Page(),
                      ),
                    );
                  },
                  child: const Text('Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                ),
              ),
              const SizedBox(height: 10),
          
            ],
          ),
        ),
      ),
    );
  }
}

