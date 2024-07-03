# weather_app
A simple Flutter weather app that displays current weather information for a given city using the OpenWeatherMap API.

## Features

- Search for a city to get weather information
- Display city name, current temperature, weather condition, humidity percentage, and wind speed
- Refresh weather data
- Save last searched city for quick access on app restart

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- OpenWeatherMap API Key: [Sign up](https://openweathermap.org/api) and get your free API key

## Getting Started

Follow these instructions to set up the project on your local machine.

### 1. Clone the Repository

```sh
https://github.com/shivaniflutter/weather_app
cd weather_app

2. Install Dependencies
flutter pub get

3. Set Up API Key
Open the file lib/services/weather_service.dart.
Replace YOUR_OPENWEATHERMAP_API_KEY with your actual OpenWeatherMap API key.

class WeatherService {
  static const String apiKey = 'YOUR_OPENWEATHERMAP_API_KEY'; // Replace with your OpenWeatherMap API key
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(double lat, double lon) async {
    final response = await http.get(Uri.parse('$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

4. Run the App
flutter run

5.Usage
1.Enter the city name in the search bar on the home screen.
2.Click the "Search" button to fetch and display the weather information.
3.The weather details screen will show the city name, temperature, weather condition, humidity, and wind speed.
4.Use the "Refresh" button on the weather details screen to refresh the weather data.




