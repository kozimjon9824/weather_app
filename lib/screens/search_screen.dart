import 'package:flutter/material.dart';
import 'package:weather_app/utils/constraints.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: FlatButton(
                padding: EdgeInsets.all(4.0),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child:Icon(Icons.arrow_back_ios,size: 30.0) ),
            ),
            
            Container(
              margin: EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: kDecoration,
                onChanged: (value){
                  print(value);
                  cityName=value;
                },
              ),
            ),
            SizedBox(height: 30.0),
            FlatButton(
                onPressed: (){
                  Navigator.pop(context,cityName);
                },
                child:Text('Get Weather',style: TextStyle(fontSize: 26.0),) )
          ],
        ),
      ),
    );
  }
}
