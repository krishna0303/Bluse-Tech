import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF282A36),
        primaryColor: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text('Contact'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('images/logo.png'),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Bluse Tech'.toUpperCase()),
              SizedBox(
                height: 15.0,
                width: 200.0,
                child: Divider(
                  color: Colors.pink,
                ),
              ),
              Text('We are here to innovate'.toUpperCase()),
              SizedBox(
                height: 10.0,
              ),
              Card(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.pink,
                  ),
                  title: Text('8229880561'),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.pink,
                  ),
                  title: Text('blusetech@gmail.com'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
