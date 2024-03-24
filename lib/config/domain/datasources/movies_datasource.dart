// Se define como lucen los orginenes de datos que pueden traer peliculas
// Define los metodos que esta clase va tener para traer el dato

// Es abstracto porque no quereremos crear instancias de ella
import 'package:cinemapedia/config/domain/entities/movie.dart';

abstract class MovieDatasource {

  Future<List<Movie>> getNowPlayying({int page = 1});

}


