import 'package:flutter/material.dart';
import 'package:login_app/widgets/UserTheme.dart';
import 'package:login_app/widgets/register.dart';
import 'package:login_app/widgets/tasks.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login();
  @override
  LoginPage createState() {
    return LoginPage();
  }
}

class LoginPage extends State<Login> {
  String username = '';
  String password = '';
  bool _isObscure = true;
  Future<String?> handlePressed() {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Nice!'),
              content: Text('Hello $username'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('Thanks!'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final userTheme = Provider.of<UserTheme>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Login page")),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: IntrinsicHeight(
              child: SizedBox(
                height: 350,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.black),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        userTheme.changeBackgroundColor(Colors.green);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Tasks()),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        primary: Colors.white,
                      ),
                      child: const Text("Clique ici pour voir le TP3"),
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                      child: Text(
                        "Si vous n'avez pas de compte créez un",
                        style: TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
