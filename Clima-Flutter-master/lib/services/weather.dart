import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '947e726cda625facb382dc1e974f3d7d';
const openUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

Future<dynamic> getCityWeather(var city) async {
NetworkHelp networkHelp = NetworkHelp(
        "$openUrl?q=$city&appid=$apiKey&units=metric");
    var weatherData = await networkHelp.getData();
    return weatherData;
}

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();
    NetworkHelp networkHelp = NetworkHelp(
        "$openUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    var weatherData = await networkHelp.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
