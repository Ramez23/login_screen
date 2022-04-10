import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  String errorText = '';
  bool redUnderLine = false;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/img.png",height: 150,),
              TextField(
                cursorColor: email.text.length > 15 && email.text.length < 40  ? Colors.green : Colors.red,
                obscureText: true,
                controller: email,
                decoration: InputDecoration(
                  hintText: "username@acc.com",
                  label: Text("Email"),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                    ),
                  errorBorder: new UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  focusedErrorBorder: new UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
                  ),
              SizedBox(height: 10,),
              TextField(
                cursorColor: password.text.length > 7? Colors.green : Colors.red,
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                    hintText: "1231sdasad",
                    label: Text("Password"),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                ),
                  errorBorder: new UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  focusedErrorBorder: new UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
              ),

          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                if(email.text.length>50){
                  setState(() => redUnderLine = true);
                  setState(() => errorText = "This field is empty");
                } else {
                  setState(() => redUnderLine = false);
                  setState(() => errorText = "");
                }
                if(password.text.length<7){
                  setState(() => redUnderLine = true);
                  setState(() => errorText = "This field is empty");
                } else {
                  setState(() => redUnderLine = false);
                  setState(() => errorText = "");
                }
                print(email.text + "\n" + password.text);
                email.clear();
                password.clear();
              },
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("log in")],))
            ],
                  )
                  )

                  ),
              );

  }
}
