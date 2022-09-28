import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myapp/Home.dart';

class Log_in extends StatefulWidget {
  const Log_in({super.key});

  @override
  State<Log_in> createState() => _Log_inState();
}

class _Log_inState extends State<Log_in> {
  final textConttoller = TextEditingController();
  final passwordcontroller = TextEditingController();
  String email = "Yousef2k012@gmail.com";
  String password = "12345";
  String userinput = '';
  String userinput2 = '';
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log in page")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 100,
              child: Image(image: AssetImage("images/2.png")),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextField(
                controller: textConttoller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Please enter your email",
                    label: Text(
                      "Email",
                      style: TextStyle(fontSize: 25),
                    ),
                    prefixIcon: Icon(Icons.people)),
                maxLines: 1,
                maxLength: 25,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Please enter your password",
                    label: Text(
                      "password",
                      style: TextStyle(fontSize: 25),
                    ),
                    prefixIcon: Icon(Icons.people)),
                maxLines: 1,
                maxLength: 25,
                textAlign: TextAlign.center,
                obscureText: true,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(
                                  "Can you please wait until we check your credentials?"),
                              Icon(Ionicons.logo_android)
                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                 setState(() {
                                  userinput = textConttoller.text;
                                  userinput2 = passwordcontroller.text;
                                  showDialog(context: context, builder: (context) {
                                    if ( userinput == email && userinput2 == password) {
                                      return AlertDialog(
                                        content: Text("Log in Successful!"),
                                      );
                                    }
                                    else { return AlertDialog(content: Text("Email Or Password doesn't exist"),);
                                    
                                    }
                                  },);
                                });
                              }, child: Text("I wil wait")),
                          ElevatedButton(
                            
                              onPressed: () {
                               setState(() {
                                 Navigator.pop(context, MaterialPageRoute(builder: (context) {
                                   return Log_in();
                                 },));
                               });
                              }, child: Text("no i can't wait"))
                        ],
                      );
                    },
                  );
                },
                child: Text("log-in"))
          ],
        ),
      ),
    );
  }
}
