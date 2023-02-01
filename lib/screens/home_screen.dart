
import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text('Peliculas en Cine'),
          elevation: 3,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context, 
                  delegate: MovieSearchDelegate()
                  );
                },
                icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Tarjetas principales
              Cardswiper(movies: moviesProvider.onDisplayMovies),

              //Listado horisontal de peliculas
              MovieSlider(
                  movies: moviesProvider.popularMovies,
                  title: 'Populares',
                  onNetxPage: () => moviesProvider.getPopularMovies()),
            ],
          ),
        ));
  }
}
