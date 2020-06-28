import 'package:akrams_app/pages/home_page.dart';
import 'package:akrams_app/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body:Stack(
        fit: StackFit.expand,
        children: <Widget>[
        Image.asset(
          "assets/background3.jpg",
          fit: BoxFit.cover,
          color: Colors.black.withOpacity(0.1),
          colorBlendMode: BlendMode.darken,
          ),

        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.emailAddress,
                         // validator: (s) {},
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                            labelText: "Username"
                          ),
                        ),

                        SizedBox(height: 20,),
                        
                        TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter your password",
                            labelText: "Password"
                          ),
                        ),

                        SizedBox(height: 20,),

                        RaisedButton(
                          onPressed: () {
                            //formKey.currentState.validate();
                            /* Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => HomePage()
                                )
                              ); */
                              Constants.prefs.setBool("loggedIn", true);
                              Navigator.pushReplacementNamed(
                                context, 
                                HomePage.routeName);
                          },
                          child: Text("Sign In"),
                          color: Colors.teal,
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
          ),
        ),
      ],
      ),
    );
  }
}