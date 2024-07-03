import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import 'weather_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final city = _controller.text;
                if (city.isNotEmpty) {
                  Provider.of<WeatherProvider>(context, listen: false)
                      .fetchWeather(city)
                      .then((_) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => WeatherScreen()),
                    );
                  });
                }
              },
              child: Text('Search'),
            ),
            SizedBox(height: 16),
            Consumer<WeatherProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return CircularProgressIndicator();
                }
                if (provider.errorMessage.isNotEmpty) {
                  return Text(provider.errorMessage);
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
