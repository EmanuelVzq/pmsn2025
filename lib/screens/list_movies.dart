import 'package:flutter/material.dart';
import 'package:pmsn2025/database/movies_database.dart';

class ListMovies extends StatefulWidget {
  const ListMovies({super.key});

  @override
  State<ListMovies> createState() => _ListMoviesState();
}

class _ListMoviesState extends State<ListMovies> {

  MoviesDatabase? moviesDB;

  @override
  void initState() {
    super.initState();
    moviesDB = MoviesDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de peliculas'),
      ),
      body: FutureBuilder(
        future: moviesDB!.SELECT(), 
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Center(child: Text('Something was wrong!'),);
          } else {
            if(snapshot.hasData){
              return ListView.builder(
                itemBuilder: (context, index) {
                  final objM = snapshot.data![index];
                  return Container(
                    height: 100,
                    color: Colors.black,
                    child: Text(objM.nameMovie!),
                  );
                },
              );
            } else{
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}
//un builder en escencia te regresa un widget a partir de un Future