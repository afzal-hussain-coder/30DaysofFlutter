
import 'package:flutter/material.dart';
import 'package:flutter_new_project/Utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeState = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          const SizedBox(
            height: 60.0,
          ),
          Image.asset(
            "assets/images/login_image.png",
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            "Welcome $name",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter username",
                    labelText: "Username",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2.0)),
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter password",
                    labelText: "Password",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2.0)),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          InkWell(
              onTap: () async {
                setState(() {
                  changeState = true;
                });
               await Future.delayed(Duration(seconds: 1));
                Navigator.pushNamed(context, MyRoutes.HomeRoutes);
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                alignment: Alignment.center,
                width: changeState ? 50 : 150,
                height: 40,
                //color: Colors.purple,
                child: changeState ? Icon(Icons.done,color: Colors.white,) : Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  shape: changeState ? BoxShape.circle:BoxShape.rectangle,
                  //borderRadius: BorderRadius.circular(changeState?50:8)

                ),
              ))

          // ElevatedButton(onPressed: () {
          //  Navigator.pushNamed(context, MyRoutes.HomeRoutes);
          // },
          //   child: const Text("Login"),
          //   style: TextButton.styleFrom(minimumSize: Size(250, 40)),)
        ],
      )),
    );
  }
}
