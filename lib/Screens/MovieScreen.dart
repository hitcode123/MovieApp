// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../bloc/MovieScreen_bloc.dart';
import '../Models/movieList_model.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);
  static const routeName = "/Movie-Screen";

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    String Token = ModalRoute.of(context)!.settings.arguments as String;
    bloc.fetchAllMovies(Token);
    return Scaffold(
      appBar: AppBar(title: Text("Movie_list")
      ),
      body: StreamBuilder(
          stream: bloc.allMovies,
          builder: (context, AsyncSnapshot<Movielist> snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return BuildList(snapshot);
            } else if (snapshot.hasError) {
              return Center(
                child: const Text("Failed Loading"),
              );
            }
            // ignore: prefer_const_constructors
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

Widget BuildList(AsyncSnapshot snapshot) {
  return GridView.builder(
      // ignore: prefer_const_constructors
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2),
      itemCount: snapshot.data.movieData.length,
      itemBuilder: (context, i) {
        return Container(
          height: 90,
          width:90,
          child: Padding(
            padding: const EdgeInsets.only(left:8.0,right:8,top: 15),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GridTile(
                  child: Container(
                    child: Image.network(snapshot.data.movieData[i].imageUrl,fit: BoxFit.cover,),
                  ),
                  footer: GridTileBar(
                      backgroundColor: Colors.black87,
                      title: Text(
                        snapshot.data.movieData[i].imageName,
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                      )),
                )),
          ),
        );
      });
}
