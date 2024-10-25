import 'package:app/userRegistration/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<Display> {
  int id = 0;
  String quote = '';
  String author = '';

  @override
  void initState() {
    super.initState();
    _fetchQuote();
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  Future<void> _fetchQuote() async {
    var url = Uri.https('quoteslate.vercel.app', '/api/quotes/random');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      setState(() {
        id = jsonResponse['id'];
        quote = jsonResponse['quote'];
        author = jsonResponse['author'];
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/background.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(quote,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 20),
                Text('~$author', style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
