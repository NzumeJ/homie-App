import 'package:flutter/material.dart';
import 'package:homie/All logins/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';




class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _rememberMe = false;


  Future<void> _signup() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,

      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
      // Handle successful sign-in
      print('Signup in: ${userCredential.user?.email}');
    } catch (e) {
      // Handle sign-in error
      print('Error: $e');
    }
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
                'SIGN-UP',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 35,
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
                    image: AssetImage('lib/assets/images/Sign up-pana.png'), // Replace with your image asset
                    height: 250,
                    width: double.infinity,
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 1),
          
              Padding(
                padding: const EdgeInsets.only(right: 250.0),
                child: Text(
                    'username'),
              ),
              TextField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  labelText: 'Nzume Jude',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: 7),
              ),
          
              const SizedBox(height: 10),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      const Text('I Agree to Terms & Conditions'),
                    ],
                  ),
          
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: ElevatedButton(
                  onPressed: _signup,
                  child: const Text('Sign-Up',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => LoginPage(),
                      ),
                      );
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

