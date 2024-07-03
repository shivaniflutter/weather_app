import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              if (provider.weather != null) {
                provider.fetchWeather(provider.weather!.cityName);
              }
            },
          ),
        ],
      ),
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : provider.weather == null
              ? Center(child: Text('No weather data available'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        provider.weather!.cityName,
                        style: TextStyle(fontSize: 32),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'http://openweathermap.org/img/wn/${provider.weather!.icon}.png',
                            scale: 1.5,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '${provider.weather!.temperature.toStringAsFixed(1)} °C',
                            style: TextStyle(fontSize: 32),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        provider.weather!.description,
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Humidity: ${provider.weather!.humidity}%',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Wind Speed: ${provider.weather!.windSpeed} m/s',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
    );
  }
}
