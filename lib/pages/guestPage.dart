import 'package:flutter/material.dart';

class guestPage extends StatefulWidget {
  const guestPage({Key? key}) : super(key: key);

  @override
  State<guestPage> createState() => _guestPageState();
}

class _guestPageState extends State<guestPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Row(
              children:[ Container(
                  child: Text('Seminarroom', style: TextStyle(fontSize: 20),),
              ),
              ]
          ),
          actions:[Container(child: ClipRRect(child: CircleAvatar(radius: 25,child: Image.asset('assets/app_logo.png'), backgroundColor: Colors.transparent,), borderRadius: BorderRadius.circular(22),))
          ,]
        ),
        body: Column(
          children: [


          ],
        ),
      ),
    );
  }
}
