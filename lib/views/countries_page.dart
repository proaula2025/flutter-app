import 'package:flutter/material.dart';
import '../controllers/countries_controller.dart';
import '../models/country_model.dart';

class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  final CountriesController _controller = CountriesController();
  List<Country> _countries = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCountries();
  }

  Future<void> _loadCountries() async {
    try {
      List<Country> countries = await _controller.fetchCountries();
      setState(() {
        _countries = countries;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error al cargar los países'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Países')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _countries.length,
              itemBuilder: (context, index) {
                final country = _countries[index];
                return ListTile(
                  leading: Image.network(
                    country.flagUrl,
                    width: 50,
                    height: 30,
                  ),
                  title: Text(country.name),
                );
              },
            ),
    );
  }
}
