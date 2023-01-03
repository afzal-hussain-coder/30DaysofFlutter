import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.white,
      child: Column(
        children:<Widget> [
          SizedBox(height: 60.0,),
         Image.asset("assets/images/login_image.png",fit: BoxFit.cover,),
          SizedBox(height: 20.0,),
          Text("Welcome",style:
          TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 20.0,),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 60.0,horizontal: 30.0),
           child: Column(
             children: [
               TextFormField(
                 decoration: InputDecoration(
                   hintText: "Enter username",
                   labelText: "Username",
                 ),
               ),
               TextFormField(
                 obscureText: true,
                 decoration: InputDecoration(
                   hintText: "Enter password",
                   labelText: "Password",
                 ),
               )
             ],
           ),
         ),
          SizedBox(height: 20.0,),
          SizedBox(
            width: 300,
            height: 40,
            child: ElevatedButton(onPressed: () {
              print("Hi Afzal");
            }, child: Text("Login")),
          )
        ],
      ),
    );
  }
}
