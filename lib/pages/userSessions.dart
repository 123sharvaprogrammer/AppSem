import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';

class UserSession extends StatefulWidget {

  @override
  State<UserSession> createState() => _UserSessionState();
}

class _UserSessionState extends State<UserSession> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:ListView.builder(itemBuilder: (context, index){
          String st = DateFormat("dd/MM/yyyy hh:mm").format(
            DateTime.parse(listResponse[index]["updatedAt"]));
          return GestureDetector(
            onTap:() {
              showModalBottomSheet<void>(
                // context and builder are
                // required properties in this widget
                context: context,
                builder: (BuildContext context) {
                  // we set up a container inside which
                  // we create center column and display text

                  // Returning SizedBox instead of a Container
                  String loginToken = listResponse[index]["infoImgs"].toString();
                  loginToken = loginToken.substring(1, loginToken.length - 1);
                  var st1 = listResponse1;
                  return ListView(
                    children: [
                        Image.network(loginToken.toString()),
                      Center(
                        child:Text(listResponse[index]["title"].toString(), overflow: TextOverflow.clip, textScaleFactor: 1.3,)
                      ),
                      SizedBox(height: 10,),
                          Container(
                            child: Center(child:Text(listResponse[index]["desc"].toString(), overflow: TextOverflow.clip, textAlign: TextAlign.center,)
                              ,),
                            padding: EdgeInsets.all(24),
                          ),
                      Text(st1.toString()),
                      Text(st)
                  ]);
            });},
            child: Container(
              padding: EdgeInsets.all(12),
              height: 200,
              child: Row(
                children: [
                  Container(child: Image.network(listResponse![index]["bannerImg"].toString(), height: 150, width: 190,),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple)
                  )
                    ),
                  SizedBox(width: 10,),
                      Flexible(
                        child: Text(listResponse[index]["title"],
                        overflow: TextOverflow.clip,
                        ),
                      ),
                ],
              ),
            ),
          );
        },
        itemCount: mapResponse == null? 0 : listResponse!.length,)
    );
  }
}
