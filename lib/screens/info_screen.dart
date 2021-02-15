import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_model.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/utils/constraints.dart';


class InfoScreen extends StatefulWidget {
  InfoScreen(this.weatherData);
  final weatherData;

  @override
  _InfoScreenState createState() => _InfoScreenState();

}

class _InfoScreenState extends State<InfoScreen> {
  int temperature;
  String icon;
  String cityName;
  String desc;
  WeatherModel model=WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData==null){
        temperature=0;
        icon='Error';
        cityName='Unknown';
        desc='Unable to get weather data';
        return;
      }
      var temp=weatherData['main']['temp'];
      temperature=temp.toInt();
      int iconData=weatherData['weather'][0]['id'];
      icon=model.getWeatherIcon(iconData);
      cityName = weatherData['name'];
      desc=weatherData['weather'][0]['description'];
    });
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                        onPressed: () async {
                          var data=await model.getLocationWeather();
                          updateUI(data);
                        },
                        child:Icon(Icons.near_me,color: Colors.white,size: 36.0,) ),

                    FlatButton(
                        onPressed: () async {
                          var typeName=await Navigator.push(context, MaterialPageRoute(builder: (context){return SearchScreen();}));
                          print(typeName);

                          if(typeName!=null){
                            var data= await model.getWeatherByCity(typeName);
                            print(typeName);
                            updateUI(data);
                          }

                        },
                        child:Icon(Icons.location_city ,color: Colors.white,size: 36.0,) )
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text(cityName,
              style: kTextCityStyle),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('$temperature°',
                  style: kTempStyle,
                  ),
                   SizedBox(width: 36.0,),
                   Text(icon,
                   style: kIconStyle,
                   )
                ],),
              ),
              Text(desc,style: kTextDesStyle)
            ],
          ),
        ),
      ),
    );
  }
}
