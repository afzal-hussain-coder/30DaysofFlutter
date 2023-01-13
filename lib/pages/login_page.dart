
import 'package:flutter/material.dart';
import 'package:flutter_new_project/Utils/routes.dart';
import 'package:flutter_new_project/widgets/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeState = false;
  final _formkey = GlobalKey<FormState>();
  final filedTextUsername= TextEditingController();
  final filedTextPassword= TextEditingController();


  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeState = true;

      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.HomeRoutes);
      setState(() {
        changeState = false;
        filedTextUsername.clear();
        filedTextPassword.clear();
        name="";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //
      //   title: Center(child: Text("Login Screen",style: TextStyle(color: context.accentColor),)),
      // ),
      body: Material(
      color: context.canvasColor,
      child: SafeArea(
        child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // const SizedBox(
                //   height: 10.0,
                // ),
                Image.asset(
                  "assets/images/loginimage.png",
                  fit: BoxFit.cover,
                  // height: 200.0,
                  // width: 230.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                      fontSize: 20, color: context.accentColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                VxArc(
                  height: 30.0,
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 70.0),
                    width: context.screenWidth,
                    height: context.screenHeight,
                    color: context.cardColor,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Enter username",
                                  labelText: "Username",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.purple, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange, width: 2.0)),

                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red,width: 2.0)
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red,width: 2.0)
                                  )
                              ),
                              controller: filedTextUsername,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Username can't be empty";
                                }
                                return null;
                              },
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
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.purple, width: 2.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.orange, width: 2.0)),

                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red,width: 2.0)
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red,width: 2.0)
                                    )
                                ),
                                controller: filedTextPassword,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Password can't be empty";
                                  }else if(value.length<6){
                                    return "Password length should be at least 6";
                                  }
                                  return null;
                                }
                            ),
                             SizedBox(
                              height: 20.0,
                            ),
                            InkWell(
                                onTap: () => moveToHome(context),
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
                                    color: context.theme.buttonColor,
                                    shape: changeState ? BoxShape.circle:BoxShape.rectangle,
                                    //borderRadius: BorderRadius.circular(changeState?50:8)

                                  ),
                                )),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),

                  ),
                ),


                // ElevatedButton(onPressed: () {
                //  Navigator.pushNamed(context, MyRoutes.HomeRoutes);
                // },
                //   child: const Text("Login"),
                //   style: TextButton.styleFrom(minimumSize: Size(250, 40)),)
              ],
            )),
      ),
    ),
    );
  }
}

