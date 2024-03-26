import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_imp.dart';
import 'package:cinemapedia/infrastructure/datasources/movies_themoviedb_datasource.dart';

final movieRepositoryProvider = Provider((ref) {

  return MovieRepositoryImpl(MoviedbDatasource());

});

