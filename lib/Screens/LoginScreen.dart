// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:movie_app/Models/postRequest_signin.dart';
import 'package:movie_app/Provider/Signin.dart';
import 'package:movie_app/Screens/MovieScreen.dart';
import 'package:movie_app/Screens/RegisterScreen.dart';

class Login extends StatefulWidget {
  static const routeName = '/Log-In';
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  Signin signRequest = Signin();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.black, Colors.white])),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 70,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ignore: prefer_const_constructors

                      // ignore: sized_box_for_whitespace
                      Container(
                          height: 140,
                          width: 140,
                          child: Image.network(
                              'https://i.morioh.com/2020/02/28/1195ab76f0b1.jpg')),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 35,
                      ),
                      // ignore: prefer_const_constructors
                      Text(
                        "LOGIN",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 35
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 45,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: TextFormField(
                            controller: _email,
                            onSaved: (val) {
                              signRequest.email = val;
                            },
                            validator: (value) {
                              if (value == null || !value.contains('@')) {
                                return 'Enter correct Email';
                              }
                              return null;
                            },
                            decoration:
                                // ignore: prefer_const_constructors
                                InputDecoration(
                            
                                    label: Text("email",style:TextStyle(color:Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width:2))
                                            , enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width: 2)),),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: TextFormField(
                          obscureText: _obscureText,
                          controller: _password,
                          onSaved: (value) {
                            signRequest.password = value;
                          },
                          validator: (value) {
                            if (value == null || value.length <= 6) {
                              return null;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                          
                              label: Text("password",style:TextStyle(color: Colors.white)),
                              suffixIcon: GestureDetector(
                                onTap: () => setState(() {
                                  _obscureText = !_obscureText;
                                }),
                                child: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width: 2)),),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                              fixedSize: Size(150, 45),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              postsignin
                                  .postRequest(signRequest.toJson())
                                  .then((value) => Navigator.of(context)
                                      .pushReplacementNamed(
                                          MovieScreen.routeName,
                                          arguments: value))
                                  .catchError((e) {
                                var snackbar =
                                    SnackBar(content: Text(e.toString()));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar);
                                Future.delayed(
                                  Duration(milliseconds: 700),
                                );
                                Navigator.of(context).pushNamed('/');
                              });
                            }
                          },
                          child: Text("LOGIN")) ,
                          SizedBox(
                        height: 5,
                      )                     
                           ,Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("You haven't registered yet ?"),TextButton(onPressed:()=>Navigator.of(context).pushNamed(RegisterUp.routeName), child:Text("Register Up"))],) ],

                    
                  
                )),
              ],
            ),
          ),
        ]));
  }
}
