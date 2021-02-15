import 'package:flutter/material.dart';

const kTextCityStyle=TextStyle(color: Colors.white,fontSize: 24.0);

const kTempStyle=TextStyle(color: Colors.white,fontSize: 90.0);
const kIconStyle=TextStyle(color: Colors.white,fontSize: 80.0);
const kTextDesStyle=TextStyle(color: Colors.white,fontSize: 20.0);

const kDecoration=InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'enter city name',
  hintStyle: TextStyle(color: Colors.black26),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0))
  ),
);