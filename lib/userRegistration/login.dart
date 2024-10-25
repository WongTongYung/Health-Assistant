import 'package:app/homePage/homepage2.dart';
import 'package:app/userRegistration/sign_up.dart';
import 'package:app/userRegistration/user.dart';
import 'package:app/userRegistration/userdb.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Creates a controller for an editable text field, with no initial selection.
  final username = TextEditingController();
  final password = TextEditingController();

  // This is for visibility password
  bool isVisible = true;
  bool isLoginTrue = false;

  //This is for calling database from userdb file
  final db = DatabaseHelper();

  //This is for creating global key
  final formkey = GlobalKey<FormState>();


  //Now we should call this function in login button
  login() async {
    var response = await db
        .login(Users(usrName: username.text, usrPassword: password.text));
    if (response == true) {
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Homepage()));
    } else {
      //If not, true the bool value to show error message
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            //wrap the whole widget in form so allow to use validator
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //put image
                const Image(
                  image: AssetImage('images/study.jpg'),
                  width: 300,
                  height: 300,
                ),
                //put text
                Container(
                    decoration: BoxDecoration(
                      color: Colors.green[400], // Use a health-related color
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(fontSize: 18),
                        ),
                        controller: username,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'username is required';
                          }
                          return null;
                        },
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.green[400], // Use a health-related color
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password is required';
                          }
                          return null;
                        },
                        obscureText: isVisible,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: const TextStyle(fontSize: 18),
                          suffixIcon: IconButton(
                            onPressed: () {
                              // Add your password visibility logic here
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: Icon(isVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                      ),
                    )),
                Container(
                    width: 200,
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.green[400], // Use a health-related color
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        child: const Text('Login',
                            style:
                                TextStyle(fontSize: 25, color: Colors.black)),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            login();
                            print('Username: ${username.text}');
                            print('Password: ${password.text}');
                          }
                        },
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          //Navigate to sign up
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text("SIGN UP"))
                  ],
                ),
                isLoginTrue
                    ? const Text(
                        "Username or passowrd is incorrect",
                        style: TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
