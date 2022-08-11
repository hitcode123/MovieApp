// ignore_for_file: sized_box_for_whitespace, unnecessary_const, duplicate_ignore, file_names, prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:movie_app/Provider/Register.dart';
import 'package:movie_app/Screens/LoginScreen.dart';

import '../Models/RegisterPost_fetch.dart';

class RegisterUp extends StatefulWidget {
  static const routeName = '/Register-Up';
  const RegisterUp({Key? key}) : super(key: key);

  @override
  State<RegisterUp> createState() => _RegisterUpState();
}

class _RegisterUpState extends State<RegisterUp> {
  PostResponse initializer = PostResponse();
  final _formkey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
  final mediaquerry= MediaQuery.of(context);
    return Scaffold(
        key: _key,
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Container(
            height: mediaquerry.size.height,
              width: mediaquerry.size.width,
            child: Stack(
              children: [Container(
                
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.black, Colors.white])),
              ),Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                         
                          Container(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                  'https://i.morioh.com/2020/02/28/1195ab76f0b1.jpg')),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Register Up",
                            style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 35
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:20.0,right:20.0,top:10.0,bottom: 10.0),
                            child: TextFormField(
                                onSaved: (val) {
                                  initializer.firstName = val;
                                },
                                decoration: InputDecoration(
                                    // ignore: unnecessary_const
                                    label: const Text("firstName",style: TextStyle(color: Colors.white)),
                                   focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width:2))
                                                  , enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width: 2)), )
                          ),),
                          Padding(
                            padding: const EdgeInsets.only(left:20.0,right: 20.0,top:10.0,bottom: 10.0),
                            child: TextFormField(
                                onSaved: (val) {
                                  initializer.lastName = val;
                                },
                                decoration: InputDecoration(
                                    label: const Text("lastName",style: TextStyle(color: Colors.white)),focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width:2))
                                                  , enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width: 2)),),)
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20,top:10.0,bottom: 10.0),
                            child: TextFormField(
                                onSaved: (val) {
                                  initializer.email = val;
                                },
                                validator: (value) {
                                  if (value == null || !value.contains('@')) {
                                    return 'Enter correct Email';
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(label: Text("email",style: TextStyle(color: Colors.white)),focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width:2))
                                                  , enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width: 2)),)),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20,top: 10,bottom:10),
                              child: TextFormField(
                                obscureText: _obscureText,
                                onSaved: (val) {
                                  initializer.password = val;
                                },
                                validator: (value) {
                                  if (value == null || value.length <= 6) {
                                    return 'Password is too Short';
                                  }
                                  return null;
                                },
                                decoration:  InputDecoration(
                                    label: Text("password",style: TextStyle(color: Colors.white),),
                                    suffixIcon: GestureDetector(
                                      onTap: () => setState(() {
                                        _obscureText = !_obscureText;
                                      }),
                                      child: Icon(_obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width:2))
                                                  , enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width: 2)),),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                  primary: Colors.redAccent,
                                  fixedSize: Size(150, 45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () async {
                                if (_formkey.currentState!.validate()) {
                                  _formkey.currentState!.save();
                                  final response = await post
                                      .postRequest(initializer.toJson())
                                      .then((value) {
                                    var snackbar = SnackBar(
                                        content: Text("Registered Successfully"));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackbar);
                                    Navigator.of(context)
                                        .pushNamed(Login.routeName);
                                  }).catchError((e) {
                                    var snackbar =
                                        SnackBar(content: Text(e.toString()));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackbar);
                                  });
                                  Future.delayed(
                                    Duration(milliseconds: 500),
                                  );
                                  Navigator.of(context).pushNamed('/');
                                }
                              },
                              child: Text("Register Up"))
                       ,SizedBox(
                        height: 5,
                      )   ,Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("You already have an Account ?"),TextButton(onPressed:()=>Navigator.of(context).pushNamed(Login.routeName), child:Text("Sign in"))],) ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
