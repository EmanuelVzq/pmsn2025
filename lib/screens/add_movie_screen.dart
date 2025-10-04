import 'package:flutter/material.dart';
import 'package:pmsn2025/database/movies_database.dart';
import 'package:pmsn2025/models/movie_dao.dart';

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
  void initState() {
    super.initState();
    movieDB = MoviesDatabase();
    conRelease.text = selectedDate.toString().substring(0, 10); // fecha inicial
  }

  @override
  Widget build(BuildContext context) {

    MovieDao? objM;
    if(ModalRoute.of(context)!.settings.arguments !=null){
      objM=ModalRoute.of(context)!.settings.arguments as MovieDao;
      conTitle.text = objM.nameMovie!;
      conTime.text = objM.time!;
      conRelease.text = objM.dateRelease!;
    }
    //extraemos los argumentos por parametros mediante una ruta nombrada

    final txtTitle = TextFormField(
      controller: conTitle,
      decoration: const InputDecoration(hintText: 'Título de la película'),
    );

    final txtTime = TextFormField(
      controller: conTime,
      decoration: const InputDecoration(hintText: 'Duración de la película'),
    );

    final txtRelease = TextFormField(
      controller: conRelease,
      readOnly: true,
      onTap: () => _selectedDate(context),
      decoration: const InputDecoration(hintText: 'Fecha de lanzamiento'),
    );

    final btnGuardar = ElevatedButton(
      onPressed: () {
        if (objM == null) {
          movieDB!.INSERT("tblMovies", {
            "nameMovie": conTitle.text,
            "time": conTime.text,
            "dateRelease": conRelease.text,
          }).then((value) => Navigator.pop(context));
        } else {
          movieDB!.UPDATE(
            "tblMovies",
            {
              "idMovie": objM.idMovie,
              "nameMovie" : conTitle.text,
              "time" : conTime.text,
              "dateRelease" : conRelease.text,
            }
            
          ).then((value) => Navigator.pop(context));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Todos los campos son obligatorios")),
          );
        }
      },
      child: const Text('Guardar'),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Insertar película')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: [txtTitle, txtTime, txtRelease, const SizedBox(height: 20), btnGuardar],
        ),
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
        conRelease.text = selectedDate.toString().substring(0, 10); // actualiza el texto
      });
    }
  }
}


//todas las solicitudes de bases de datos y apis se hacen en segundo plano por lo que se usa statefulwidget
