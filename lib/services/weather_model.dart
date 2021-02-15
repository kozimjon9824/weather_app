import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const apiKey = '346436bec0d78b119e541233b9439814';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

  class WeatherModel{

    Future<dynamic> getWeatherByCity(String city) async {

      NetworkHelper networkHelper=
      NetworkHelper('$openWeatherMapURL?q=$city&appid=$apiKey&units=metric');

      var weatherData=await networkHelper.getData();
      return weatherData;
    }


    Future<dynamic> getLocationWeather() async {
      Location location=Location();
      await location.getLocation();
      
      NetworkHelper networkHelper=NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

      var weatherData=await networkHelper.getData();
      return weatherData;
    }

    String getWeatherIcon(int condition) {
      if (condition < 300) {
        return '🌩';
      } else if (condition < 400) {
        return '🌧';
      } else if (condition < 600) {
        return '☔';
      } else if (condition < 700) {
        return '☃';
      } else if (condition < 800) {
        return '🌫';
      } else if (condition == 800) {
        return '☀';
      } else if (condition <= 804) {
        return '☁';
      } else {
        return '🤷‍';
      }
    }

  }