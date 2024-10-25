import 'package:app/userRegistration/login.dart';
import 'package:app/userRegistration/user.dart';
import 'package:app/userRegistration/userdb.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //Creates a controller for an editable text field, with no initial selection.
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  //This is for creating global key
  //access the properties and methods of the Form widget,
  //such as validation and saving.
  //How It Works: When you call formKey.currentState!.validate(), it triggers the
  // validation logic for all the form fields. Each field’s validator function is
  // called, and if any field is invalid, the method returns false.
  final formkey = GlobalKey<FormState>();
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
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ListTile(
                  title: Text('Register    New account',
                      style: TextStyle(
                          fontSize: 53,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
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
                        controller: username,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username is required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(fontSize: 18),
                        ),
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
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(fontSize: 18),
                        ),
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
                        controller: confirmPassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm password is required';
                          } else if (password.text != confirmPassword.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(fontSize: 18),
                        ),
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
                      child: TextButton(
                        child: const Text('Sign up',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black)),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            print('Username: ${username.text}');
                            print('Password: ${password.text}');
                            //Login method will be here

                            final db = DatabaseHelper();
                            db
                                .signup(Users(
                                    usrName: username.text,
                                    usrPassword: password.text))
                                .whenComplete(() {
                              //After success user creation go to login screen
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            });
                          }
                        },
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
