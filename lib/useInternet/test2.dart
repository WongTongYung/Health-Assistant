import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  var url = Uri.https('pokeapi.co', '/api/v2/pokemon/pikachu');

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonResponse);

    // Extracting relevant data
    String name = jsonResponse['name'];
    int baseExperience = jsonResponse['base_experience'];
    var abilities = jsonResponse['abilities'] as List;

    // Displaying the extracted data
    print('Name: $name');
    print('Base Experience: $baseExperience');
    print('Abilities:');
    for (var ability in abilities) {
      print('- ${ability['ability']['name']}');
    }
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
