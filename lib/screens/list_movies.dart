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
        title: const Text('Lista de peliculas'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/add').then((value)=> setState(() {}));
            }, 
            icon: Icon(Icons.add)
          ),
        ],
      ),
      body: FutureBuilder(
        future: moviesDB!.SELECT(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something was wrong!'),
            );
          } else {
            if (snapshot.hasData) {
              return snapshot.data!.isNotEmpty
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final objM = snapshot.data![index];
                        return Container(
                          height: 100,
                          color: Colors.black,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(objM.nameMovie!),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: ()=>Navigator.pushNamed(context, "/add",arguments: objM).then((value) => setState((){}),),
                                    //para mandar datos entre pantallas se utiliza arguments 
                                    icon: Icon(Icons.edit)
                                  ),
                                  Expanded(child: Container()),
                                  IconButton(
                                  onPressed: () async{
                                    return showDialog(
                                      context: context, 
                                      builder: (context) => _buildAlertDialog(objM.idMovie!),
                                    );
                                  }, 
                                  icon: Icon(Icons.delete))
                                ],
                              )
                            ]
                            ,
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text('No existen registros'),
                    );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        },
      ),
    );
  }

  Widget _buildAlertDialog(int idMovie){
    return AlertDialog(
      title: Text('Atencion'),
      content: Text('¿Deseas eliminar el registro?'),
      actions: [
        TextButton(
          onPressed: (){
            moviesDB!.DELETE("tblMovies", idMovie).then((value) {
                final msj;
              if(value > 0){
                msj = "Registro borrado exitosamente";
                setState(() {});
              } else {
                msj = "No se elimino el registro";
              }
              final snackBar = SnackBar(content: Text(msj));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pop(context);
            },);
          }, 
          child: Text('Aceptar')
        ),
        TextButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          child: Text('Cancelar', style: TextStyle(color: Colors.red),)
        ),
      ],
    );
  }
}
