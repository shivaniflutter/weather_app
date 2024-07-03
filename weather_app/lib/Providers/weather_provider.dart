import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/Services/Weather_service.dart';
import '../models/weather.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;
  String _errorMessage = '';

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final WeatherService _weatherService = WeatherService();

  Future<void> fetchWeather(String city) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final data = await _weatherService.fetchWeather(city);
      _weather = Weather.fromJson(data);
      await _saveLastSearchedCity(city);
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadLastSearchedCity() async {
    final prefs = await SharedPreferences.getInstance();
    final city = prefs.getString('lastSearchedCity');
    if (city != null) {
      await fetchWeather(city);
    }
  }

  Future<void> _saveLastSearchedCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lastSearchedCity', city);
  }
}
