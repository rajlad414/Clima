import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey= '286a1a88313a6e1a2bd3b2fc0d6f7172' ;
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  double longitude,latitude;

  Future<dynamic> getCityWeather(var cityName) async{
    print(cityName);

    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey';
    NetworkHelper networkHelper =NetworkHelper(url);
    var weatherData =await networkHelper.getData();
    print(weatherData);
    print('hello');
    return weatherData;

  }
  Future<dynamic> getLocationWeather() async {
    Location location=Location();
    await location.getCurrentLocation();
    latitude=location.latitude;
    longitude=location.longitude;

    NetworkHelper networkHelper =NetworkHelper('$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData =await networkHelper.getData();
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
