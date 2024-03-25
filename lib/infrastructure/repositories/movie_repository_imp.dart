import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

// Para cambiar facilmente los origenes de datos desde riverpod. 
class MovieRepositoryImpl extends MoviesRepository {

  final MoviesDatasource datasource;
   
  MovieRepositoryImpl(this.datasource);


  @override
  Future<List<Movie>> getNowPlayying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }


}
