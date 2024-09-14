import 'package:flutter/material.dart';
import 'countries_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Países',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Ver Países',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                ),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CountriesPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'Ve al menú para ver los países',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
