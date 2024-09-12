import 'package:flutter/material.dart';
import 'package:homie/All logins/login.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ForgotPassword2 Page',
      home: const ForgotPassword2Page(),
    );
  }
}

class ForgotPassword2Page extends StatefulWidget {
  const ForgotPassword2Page({Key? key}) : super(key: key);

  @override
  _ForgotPassword2PageState createState() => _ForgotPassword2PageState();
}

class _ForgotPassword2PageState extends State<ForgotPassword2Page> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  void _login() {
    // Add your authentication logic here
    String email = _emailController.text;
    String password = _passwordController.text;
    print('Email: $email, Password: $password');
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
                'RESET PASSWORD',
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
                    image: AssetImage('lib/assets/images/Confirmed-amico.png'), // Replace with your image asset
                    height: 250,
                    width: double.infinity,
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
          
              Text('Enter new password to reset your password'),
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
          
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 250.0),
                child: Text('Password'),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: '............',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: 7),
              ),
              const SizedBox(height: 10),
          
              const SizedBox(height: 80),
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
                  child: const Text('Reset Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
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

