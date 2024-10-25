import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  var url = Uri.https('quoteslate.vercel.app', '/api/quotes/random');

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonResponse);

    // Extracting relevant data
    // int id = jsonResponse['id'];
    // String quote = jsonResponse['quote'];
    // String author = jsonResponse['author'];

    // // Displaying the extracted data
    // print('id: $id');
    // print('quote: $quote');
    // print('author: $author');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
