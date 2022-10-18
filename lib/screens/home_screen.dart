import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {

  final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cine'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [          
            CardSwiperScreen( movies: moviesProvider.onDisplayMovies ),
            MovieSlider(
              movies: moviesProvider.popularMovies,// populares,
              title: 'Populares', // opcional
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
      
        ],
        ),
      )
    );
  }
}