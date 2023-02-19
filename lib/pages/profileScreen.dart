import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
var Name = "Rohit mohan";
var Credits = "2000";
var Email = "Hello guys";
var ImageAvatar = "assets/userprofile.png";
Profile({Key? key}) : super(key: key);
@override
Widget build(BuildContext context) {
  return Scaffold(
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.edit_outlined),
      backgroundColor: Color.fromARGB(255, 255, 131, 240),
      onPressed: () {
        Navigator.pushNamed(context, '/editProfile');
      },
    ),
    body: Column(
      children: [
        const SizedBox(
          height: 90,
        ),
        Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.grey[50],
                backgroundImage: NetworkImage('${FirebaseAuth.instance.currentUser!.photoURL}'),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(12),
          child: ClipRRect(
            child:  Column(
                children: [
                  Divider(),
                  SizedBox(height: 8,),
                Row(
                      children: [
                        Text('Name: ', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 131, 240), decoration: TextDecoration.underline),),
                        Text('${FirebaseAuth.instance.currentUser!.displayName}')
                      ],
                    ),
                  SizedBox(height: 20,),
                  Row(
                      children: [
                        Text('Course: ', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 131, 240), decoration: TextDecoration.underline),),
                        Text('${FirebaseAuth.instance.currentUser!.displayName}')
                      ],
                    ),
                  SizedBox(height: 20,),
                  Row(
                      children: [
                        Text('Age: ', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 131, 240), decoration: TextDecoration.underline),),
                        Text('${FirebaseAuth.instance.currentUser!.phoneNumber}')
                      ],
                    ),
                  SizedBox(height: 20,),
                  Row(
                      children: [
                        Text('College / University: ', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 131, 240), decoration: TextDecoration.underline),),
                        Text('${FirebaseAuth.instance.currentUser!.displayName}')
                      ],
                    ),
                  ]
              ),
          ),
        ),
    Column(
      children: [Divider()],
    )
  ]));
}
}
