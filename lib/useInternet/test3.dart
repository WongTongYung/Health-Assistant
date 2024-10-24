import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokémon Info',
      home: PokemonScreen(),
    );
  }
}

class PokemonScreen extends StatefulWidget {
  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  Map<String, dynamic>? _pokemonData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPokemonData();
  }

  Future<void> _fetchPokemonData() async {
    var url = Uri.https('pokeapi.co', '/api/v2/pokemon/pikachu');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _pokemonData = convert.jsonDecode(response.body);
        _isLoading = false;
      });
    } else {
      // Handle error appropriately
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokémon Info')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _pokemonData != null
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${_pokemonData!['name']}',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Base Experience: ${_pokemonData!['base_experience']}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Abilities:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      ...(_pokemonData!['abilities'] as List).map((ability) {
                        return Text('- ${ability['ability']['name']}');
                      }).toList(),
                    ],
                  ),
                )
              : Center(child: Text('Failed to load Pokémon data.')),
    );
  }
}
