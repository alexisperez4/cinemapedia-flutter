import 'package:cinemapedia/infrastructure/datasources/actor_themoviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Este repositorio es inmutable
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl( ActorMovieDbDatasource() );
});