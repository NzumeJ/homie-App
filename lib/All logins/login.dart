import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homie/All logins/signup.dart';
import 'package:homie/All logins/ForgotPassword1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:homie/Dashboard.dart';





class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _rememberMe = false;
  bool _isLoading = false;


  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      setState(() {
        _isLoading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
      // Handle successful sign-in
      print('Signed in: ${userCredential.user?.email}');
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
                'WELCOME TO',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
              ),
              ),
              Text(
                'HOMIE',
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
                    image: AssetImage('lib/assets/images/Mobile login-cuate.png'), // Replace with your image asset
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
                    'Email'),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'info@gmail.com',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: 15),
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
                style: TextStyle(fontSize: 15),
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
                      const Text('Remember me'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => ForgotPassword1Page(),
                        ),
                      );// Add your forgot password logic here
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login',
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
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => SignUpPage(),
                        ),
                      );// Navigate to sign-up page
                    },
                    child: const Text('Sign Up'),
                  ),
                ],


              ),

              if (_isLoading)
                Stack(
                  children: [
                    ModalBarrier(dismissible: false, color: Colors.black.withOpacity(0.5)),
                    Center(
                      child: CircularProgressIndicator(),
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


