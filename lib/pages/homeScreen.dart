import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/services.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:untitled1/pages/NotificationScreen.dart';
import 'package:untitled1/pages/profileScreen.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled1/pages/userSessions.dart';
import 'package:untitled1/provider/theme_provider.dart';

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  late int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    UserSession(),
    Notifications(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    final coloury = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Colors.black
        : Colors.white;
    final colourt = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;
    final colour = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Colors.black
        : Colors.white;

    final colourd = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Colors.black
        : Colors.white;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: coloury, systemNavigationBarIconBrightness: colourt));
    final color = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Color.fromRGBO(27, 27, 27, 1)
        : Colors.white;
    final colours = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    return MaterialApp(
      routes: {
        '/sessionPage': (context) => UserSession()
      },
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Kindacode.com',
        theme: Mythemes.lightTheme,
        darkTheme: Mythemes.darkTheme,
        themeMode: ThemeMode.system,
        home: Scaffold(
            body:IndexedStack(
          index: _selectedIndex,
          children: [
            HomePage(),
            UserSession(),
            Notifications(),
            Profile()
          ],
        ),
            bottomNavigationBar: Container(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 20, color: colour)],
                ),
                child: SafeArea(
                  child: GNav(
                    rippleColor:colourd,
                    hoverColor: colourd,
                    gap: 8,
                    activeColor: Colors.black,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    duration: Duration(milliseconds: 400),
                    tabBackgroundColor: Colors.grey[100]!,
                    color: colours,
                    tabBorderRadius: 12,
                    textStyle: TextStyle(fontFamily: 'Sora-light', color: Colors.black, fontSize: 12),
                    tabs: [
                      GButton(
                        icon: LineIcons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: LineIcons.video,
                        text: 'My Sessions',
                      ),
                      GButton(
                        icon: Icons.notifications_none_rounded,
                        text: 'Notifications',
                      ),
                      GButton(
                        icon: LineIcons.user,
                        text: 'Profile',
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    backgroundColor: colour,
                  ),
                ),
                margin: EdgeInsets.only(bottom: 8, top: 6, left: 8, right: 8),
              ),
              color: colour,
            ), ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    UserSession(),
    Notifications(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    final colour = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Colors.black
        : Colors.white;
    final colours = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: Mythemes.lightTheme,
        darkTheme: Mythemes.darkTheme,
        home:  Builder( //so you can use the context down the tree for Theme.of(context)
            builder: (context) {
              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                  statusBarColor: Theme.of(context).accentColor
                ),
                child: Homes(),
              );
            }
        ),);
  }
}

class Homes extends StatefulWidget {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    UserSession(),
    Notifications(),
    Profile()
  ];
  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  late int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    print (FirebaseAuth.instance.currentUser?.photoURL.toString());
    final colour = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Colors.black
        : Colors.white;
    final colours = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    if (
    FirebaseAuth.instance.currentUser?.metadata.creationTime ==
    FirebaseAuth.instance.currentUser?.metadata.lastSignInTime
    ) {
      print("object");
    // sign up
    } else {
      print("12");
    // login
    }
   return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: Text('Welcome, ${FirebaseAuth.instance.currentUser!.displayName}'),
            actions: [
              Container(
                //height: 25.0,
                // width: 25.0,
                child: CircleAvatar(
                  backgroundImage: NetworkImage('${FirebaseAuth.instance.currentUser!.photoURL}')
                  ),
                )
            ],
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search for something',
                        prefixIcon: Icon(Icons.search, color: Colors.black,),
                        suffixIcon: Icon(Icons.camera_alt, color: Colors.black,)),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
               SizedBox(
                height: 400,
                child: Column(
                  children: [
                    SignOutButton(),
              ]),

               ),
              Container(
                height: 1000,
                color: Colors.pink,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
