import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';


class HomeScreen extends StatelessWidget {
  
  static const name = 'home-screen';
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read( nowPlayingmoviesProvider.notifier ).loadNextPage();
    ref.read( popularMoviesProvider.notifier ).loadNextPage();
    ref.read( upcomingMoviesProvider.notifier ).loadNextPage();
    ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch( moviesSlideshowProvider );
    final nowPlayingMovies = ref.watch(nowPlayingmoviesProvider);
    final popularMovies = ref.watch( popularMoviesProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );
    final upcomingMovies = ref.watch( upcomingMoviesProvider );


    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),

        SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
              
                  MoviesSlideshow(movies: slideShowMovies),
              
                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En Cines',
                    subTitle: 'Lunes 20',
                    loadNextPage: (){ 
                      ref.read(nowPlayingmoviesProvider.notifier).loadNextPage();
                    },
                  ),

                  MovieHorizontalListview(
                    movies: upcomingMovies,
                    title: 'Proximamente',
                    subTitle: 'En este mes',
                    loadNextPage: (){ 
                      ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                    },
                  ),
              
                  MovieHorizontalListview(
                    movies: popularMovies,
                    title: 'Populares',
                    // subTitle: 'Lunes 20',
                    loadNextPage: (){ 
                      ref.read(popularMoviesProvider.notifier).loadNextPage();
                    },
                  ),
              
                  MovieHorizontalListview(
                    movies: topRatedMovies,
                    title: 'Mejor calificadas',
                    subTitle: 'Desde siempre',
                    loadNextPage: (){ 
                      ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                    },
                  ),

                  const SizedBox(height: 15)
              
                ],
              );
            },
            childCount: 1
          ),
        ),
      ]
    );
  
  
  }

}

