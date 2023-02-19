import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:untitled1/provider/theme_provider.dart';
import 'home.dart';
import './guestPage.dart';


class TOT extends StatefulWidget {
  const TOT({Key? key}) : super(key: key);

  @override
  State<TOT> createState() => _TOTState();
}

class _TOTState extends State<TOT> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: POP(),
    );
  }
}


class POP extends StatefulWidget {
  const POP({Key? key}) : super(key: key);

  @override
  State<POP> createState() => _POPState();
}

class _POPState extends State<POP> {


  @override
  Widget build(BuildContext context) {

    final coloury = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Colors.black
        : Colors.white;
    final colourt = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: coloury, systemNavigationBarIconBrightness: colourt));
    return MaterialApp(
      routes: {
        '/guestPage': (context) => guestPage()
      },
      debugShowCheckedModeBanner: false,
      theme: Mythemes.lightTheme,
      darkTheme: Mythemes.darkTheme,
      themeMode: ThemeMode.system,
      home:  Builder( //so you can use the context down the tree for Theme.of(context)
          builder: (context) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                  statusBarColor: Theme.of(context).accentColor
              ),
              child: SplashScreen(
                seconds: 1,
                navigateAfterSeconds:  SecondScreen(),
                title: new Text('Seminarroom',textScaleFactor: 2,),
                image: new Image.asset('assets/app_logo.png', width: 100,),
                photoSize: 100.0,
                loaderColor: Color.fromRGBO(68, 10, 103, 1),
              ),
            );
          }
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: Mythemes.lightTheme,
      darkTheme: Mythemes.darkTheme,
      home: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            elevation: 0,
            title:             Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(image: AssetImage('assets/app_logo.png'), height: 50,)
                ],
              ),
              margin: EdgeInsets.only(top: 20, right: 20),
            ),
          ),
          body: Column(
            children: [
              Column(
                children: [
                  SizedBox(height:MediaQuery.of(context).size.height /15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text('What is Seminarroom', style: TextStyle(color: Color.fromARGB(255, 255, 131, 240),),
                        textAlign:TextAlign.left,
                        textScaleFactor: 3.4,
                    ),
                      margin: EdgeInsets.only(left: 24),
                    ),
                  )
                ],
              ),
              SizedBox(height: 23),
              Container(
                child: Text('Making students love their subjects is the first step in creating academic excellence.', style: TextStyle(fontFamily: 'Sora-medium'), textScaleFactor: 1.3, textAlign: TextAlign.left,),
              margin: EdgeInsets.only(left: 24),
              ),
              SizedBox(height: 40),
              Image(image: AssetImage('assets/tao.png'), width: MediaQuery.of(context).size.width),
              SizedBox(height: 93),
              Container(
                child: TextButton(onPressed: () {
                  Navigator.pushNamed(context, '/guestPage');
                  _loginOrSignup(context);
                }, child: Text('Explore More', style: TextStyle(color: Colors.white, fontFamily: 'Sora-Bold'), textScaleFactor: 1.2,), style: TextButton.styleFrom(
            fixedSize: Size(150, 50),
                  backgroundColor: Color.fromARGB(255, 255, 131, 240),
                ),),
              )
            ],
          )
      ),
    );
  }
}
void _loginOrSignup(context){
  showModalBottomSheet(context: context, builder: (BuildContext bc){
    return ClipRRect(
      child: Container(height: MediaQuery.of(context).size.height / 3.6, child: Column(
        children: [
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text('Register', textScaleFactor: 1.4,), style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 255, 131, 240),
            minimumSize: Size(150, 50)
          ),),
          SizedBox(height: 20),
               Container(
                 child: Row(
              children: [
                  Align(child: Text('Already registered?'),),
                  GestureDetector(child: Text('Login', style: TextStyle(decoration: TextDecoration.underline, color: Colors.black),), onTap: () {print('asdf');},)
              ],
            ),
                 margin: EdgeInsets.only(left: MediaQuery.of(context).size.width /3.8),
               ),
          SizedBox(height: 20),
          Center(child: ClipRRect(child: Container(child: Padding(child: Text('We inspire students of higher education through our', textAlign: TextAlign.center,), padding: EdgeInsets.all(4),), margin: EdgeInsets.only(left: 12, right: 12), color: Colors.grey[300],), borderRadius: BorderRadius.circular(100)))
        ],
      ),
      color: Colors.transparent,
      ),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
    );
  });
}