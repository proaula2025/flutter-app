import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country_model.dart';

class CountriesController {
  Future<List<Country>> fetchCountries() async {
    final url = Uri.parse('https://restcountries.com/v3.1/all');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((country) => Country.fromJson(country)).toList();
    } else {
      throw Exception('Error al cargar los países');
    }
  }
}
