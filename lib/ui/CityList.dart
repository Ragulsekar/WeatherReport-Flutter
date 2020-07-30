import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CityWeather.dart';

class CityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyLayout(),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }

  Widget _myListView(BuildContext context) {
    final cities = [
      'Chennai',
      'Kolkata',
      'Mumbai',
      'New York',
      'Pune',
      'New Delhi',
      'Irvine',
      'Paris',
      'Rome',
      'Dubai',
      'Hyderabad'
    ];

    return ListView.builder(
      itemCount: cities.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white,
          child: ListTile(
            title: Text(
              cities[index],
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xFF1a1a4b),
              ),
            ),
            trailing: Icon(Icons.location_city),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CityWeatherDetails(
                      city: cities[index],
                    ),
                  ));
            },
          ),
        );
      },
    );
  }
}
