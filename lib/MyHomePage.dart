import 'package:flutter/material.dart';
import 'package:movie_app/Screens/LoginScreen.dart';
import 'package:movie_app/Screens/RegisterScreen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      
      body: Stack(
        children:[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
             gradient: LinearGradient(begin:Alignment.topRight,end:Alignment.bottomLeft,colors: [Colors.blue,Colors.red]) 
            ),
          ),

           Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 100,),
          Text(
            "Welcome....",
            style: TextStyle(color: Colors.white,fontSize: 50)
          ),
          SizedBox(height: 40,),
          Expanded(
              child: Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  child: Image.asset(
                      'Assets/home_page.png'),
                  height: 400,
                  width: 400,
                )),
          )),
          SizedBox(
            height: 40,
          ),
          Expanded(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      height: 50,
                      width: 260,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.blue,
                          border: Border.all(color: Colors.black, width: 2)),
                      child: TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushNamed(RegisterUp.routeName),
                          child: Text(
                            "REGISTER NOW",
                            style: TextStyle(color: Colors.white),
                          )))),
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    height: 50,
                    width: 260,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.red,
                        border: Border.all(color: Colors.black, width: 2)),
                    child: TextButton(
                        onPressed: (() =>
                            Navigator.of(context).pushNamed(Login.routeName)),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        ))),
              ),
            )
          ]))
        ]),
        ]),
    );
  }
}
