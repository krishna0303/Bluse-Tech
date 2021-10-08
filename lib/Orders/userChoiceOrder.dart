import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class UserChoiceOrder extends StatefulWidget {
  const UserChoiceOrder({Key key}) : super(key: key);

  @override
  _UserChoiceOrderState createState() => _UserChoiceOrderState();
}

class _UserChoiceOrderState extends State<UserChoiceOrder> {
  final controllerName = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              // colors: [Colors.pink, Colors.lightGreenAccent],
              colors: [Colors.black, Colors.black],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Sew My Design",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.white,
            ),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField(title: 'name', controller: controllerName),
            const SizedBox(height: 8),
            buildTextField(title: 'phone', controller: controllerPhone),
            const SizedBox(height: 8),
            buildTextField(title: 'email', controller: controllerEmail),
            const SizedBox(height: 8),
            buildTextField(title: 'Subject', controller: controllerSubject),
            const SizedBox(height: 8),
            buildTextField(
                title: 'Message', controller: controllerMessage, maxLines: 8),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
                textStyle: TextStyle(fontSize: 20),
                primary: Colors.black,
              ),
              child: Text("SEND"),
              onPressed: () => sendEmail(
                name: controllerName.text,
                phone: controllerPhone.text,
                email: controllerEmail.text,
                subject: controllerSubject.text,
                message: controllerMessage.text,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
          {@required String title,
          @required TextEditingController controller,
          int maxLines = 1}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      );

  Future sendEmail(
      {@required String name,
      @required String phone,
      @required String email,
      @required String subject,
      @required String message}) async {
    final serviceId = 'service_h81fst9';
    final templateId = 'template_bdfaxm5';
    final userId = 'user_Z7dde7Aw9WJaSBatzWYi6';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_phone': phone,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
        },
      }),
    );
    Fluttertoast.showToast(
        msg:
            "Congratulations, your message has been sent successfully. Our team will reach you soon!");

    Route route = MaterialPageRoute(builder: (c) => SplashScreen());
    Navigator.pushReplacement(context, route);
  }

  // Future launchEmail({@required String toEmail, @required String subject, @required String message}) async{
  //   final url='mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
  //   if( await canLaunch(url)){
  //     await launch(url);
  //   }
  // }
}
