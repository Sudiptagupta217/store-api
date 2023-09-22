import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:store_api_flutter_course/screen/home_screen.dart';
import 'package:store_api_flutter_course/services/apihandler.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailControler,
              decoration: InputDecoration(
                label: Text("Email Enter"),
                border: OutlineInputBorder(),
                // hintText: "Email"
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordControler,
              decoration: InputDecoration(
                label: Text("Password Enter"),
                border: OutlineInputBorder(),
                // hintText: "Email"
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap:()  async {

                final result = await APIHanlder.logIn(emailControler.text.toString(), passwordControler.text.toString());
                if(result == "loginsuccess"){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                  print("Login Successfully");
                }else{
                  print("login failed");
                }

              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("Login",style: TextStyle(color: Colors.white),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}