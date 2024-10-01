import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String _password = "";
  bool isClicked = false;
  bool _isPasswordVisible = false; 


  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          username: _username,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 152, 185, 243),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'images/logo.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,  
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Selamat Datang!",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'images/illustration.png',
                    height: 250,
                    fit: BoxFit.contain, 
                  ),
                  const SizedBox(height: 40),
                  _usernameField(),
                  const SizedBox(height: 20),
                  _passwordField(),
                  const SizedBox(height: 20),
                  _loginButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _usernameField() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          _username = value;
        });
      },
      decoration: const InputDecoration(
        hintText: 'Masukan Username',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }


  Widget _passwordField() {
    return TextFormField(
      obscureText: !_isPasswordVisible, 
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
      decoration: InputDecoration(
        hintText: 'Masukan Password',
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }


  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            isClicked ? Colors.green : Colors.yellowAccent),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 15)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: () {
        if (_username == "Marbella" && _password == "kuis") {
          _navigateToHome();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Berhasil'),
            ),
          );
          setState(() {
            isClicked = !isClicked;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Gagal. Username atau Password salah!'),
            ),
          );
        }
      },
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 21),
      ),
    );
  }
}
