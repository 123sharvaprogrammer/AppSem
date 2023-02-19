import 'dart:convert';

import 'package:flutter/material.dart';
import './homeScreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
late String stringResponse;
Map? mapResponse;
Map? mapResponse1;
Map? mapResponse2;
Map? dataResponse;
late List listResponse;
List? listResponse1;
List? listResponse2;
class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future callApi() async{
    http.Response response;
    response = await http.get(Uri.parse("https://test.seminarroom.in/api/v1/session"));
    if(response.statusCode ==200){
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!["completedSessions"];
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callApi();
  }
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    home: homeScreen(),
        debugShowCheckedModeBanner: false,
  );
  }
}