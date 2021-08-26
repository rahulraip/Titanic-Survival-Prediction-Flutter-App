

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:animated_button/animated_button.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlue[800],
      accentColor: Colors.cyan[600],

      // Define the default font family.
      fontFamily: 'Georgia',
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Titanic prediction'),
          centerTitle: true,
          textTheme: TextTheme(),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Survive or not',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApps()),
                        );
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    // ignore: deprecated_member_use
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}

late String nm;
late String gn;
late String age;
late String pclass;
late String parch;
late String emb;
var result = null;
class MyApps extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

 
class _MyAppState extends State<MyApps>
 {
  web() async {
         var r = await http.get(Uri.http("192.168.56.101", "/cgi-bin/app.py", {
      "nm": nm,
      "gn": gn,
      "age": age,
      "pclass": pclass,
      "parch": parch,
      "emb": emb
    }),);
    

    setState(( ) {
result = r.body;
});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600],

          // Define the default font family.
          fontFamily: 'Georgia',
        ),
        home: Scaffold(
          appBar: AppBar(
              title: Text('Titanic prediction using ML/DL '),
              backgroundColor: Colors.amber,
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: web,
                  icon: Icon(Icons.email),
                ),
              ]),
          body: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('titanic.jpg'),
                radius: 100,
              ),
              TextField(
                onChanged: (value) {
                  nm = value;
                },
                autocorrect: false,
                textInputAction: TextInputAction.continueAction,
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.directions_boat_filled,
                    color: Colors.amber,
                  ),
                  hintText: "enter your name",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.amber),
                ),
              ),
              TextField(
                onChanged: (value) {
                  gn = value;
                },
                autocorrect: false,
                textInputAction: TextInputAction.continueAction,
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.directions_boat_filled,
                    color: Colors.amber,
                  ),
                  hintText: "enter your gender in M/F/O format",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.blueAccent),
                ),
              ),
              TextField(
                onChanged: (value) {
                  age = value;
                },
                autocorrect: false,
                textInputAction: TextInputAction.continueAction,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.directions_boat_filled,
                    color: Colors.amber,
                  ),
                  hintText: "enter your age",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.pinkAccent),
                ),
              ),
              TextField(
                onChanged: (value) {
                  pclass = value;
                },
                autocorrect: false,
                textInputAction: TextInputAction.continueAction,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.directions_boat_filled,
                    color: Colors.amber,
                  ),
                  hintText: "enter your Pclass",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      color: Colors.amber.shade500),
                ),
              ),
              TextField(
                onChanged: (value) {
                  parch = value;
                },
                autocorrect: false,
                textInputAction: TextInputAction.continueAction,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.directions_boat_filled,
                    color: Colors.amber,
                  ),
                  hintText: "enter your Number of Parents/Children Aboard.",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      color: Colors.orange),
                ),
              ),
              TextField(
                onChanged: (value) {
                  emb = value;
                },
                autocorrect: false,
                textInputAction: TextInputAction.continueAction,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.directions_boat_filled,
                    color: Colors.amber,
                  ),
                  hintText: "enter the embark number",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      color: Colors.indigoAccent),
                ),
              ),
              TextButton(onPressed: web, child: Text("enter ")),
              
              Text(
                "Result : ${result}",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontFamily: "courier new",
                  fontSize: 30.0,
                ),
              )
            ],
          ),
        ));
  }
}
