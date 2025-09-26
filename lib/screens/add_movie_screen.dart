import 'package:flutter/material.dart';
import 'package:pmsn2025/database/movies_database.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({super.key});

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  MoviesDatabase? movieDB;
  DateTime selectedDate = DateTime.now();
  TextEditingController conTitle = TextEditingController();
  TextEditingController conTime = TextEditingController();
  TextEditingController conRelease = TextEditingController();
  @override
  @override
  void initState() {
    super.initState();
    super.initState();
    movieDB = MoviesDatabase();
  }

  Widget build(BuildContext context) {

    conRelease.text = selectedDate.toString();
    final txtTitle = TextFormField(
      controller: conTitle,
      decoration: InputDecoration(hintText: 'Titulo de la pelicula'),
    );
    final txtTime = TextFormField(
      controller: conTime,
      decoration: InputDecoration(hintText: 'Duracion de la pelicula'),
    );
    final txtRelease = TextFormField(
      controller: conRelease,
      onTap: () => _selectedDate(context),
      decoration: InputDecoration(hintText: 'Fecha de lanzamiento'),
    );
    final btnGuardar = ElevatedButton(
      onPressed: () {
        movieDB!.INSERT("tblMovies", {
          "nameMovie": conTitle.text,
          "time": conTime.text,
          "dateRelease": conRelease,
        }).then((value)=>Navigator.pop(context),);
      }, 
      child: Text('Guardar'));

    return Scaffold(
      appBar: AppBar(title: Text('Insertar pelicula')),
      body: ListView(
        shrinkWrap: true,
        children: [txtTitle, txtTime, txtRelease, btnGuardar],
      ),
    );
  }

  _selectedDate(BuildContext context) async {
    final DateTime? picket = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(2035),
    );
    if (picket != null && picket != selectedDate) {
      setState(() {
        selectedDate = picket;
      });
    }
  }
}

//todas las solicitudes de bases de datos y apis se hacen en segundo plano por lo que se usa statefulwidget
