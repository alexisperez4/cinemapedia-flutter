import 'package:cinemapedia/config/domain/entities/movie.dart';

abstract class MovieDatasource {

  Future<List<Movie>> getNowPlayying({int page = 1});

}
