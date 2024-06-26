// Se define como lucen los orginenes de datos que pueden traer peliculas
// Define los metodos que esta clase va tener para traer el dato

// Es abstracto porque no quereremos crear instancias de ella
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {

  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});


  Future<Movie> getMovieById( String id);

}


