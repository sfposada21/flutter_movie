import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class CardSwiperScreen extends StatelessWidget {
   
  final List<Movie> movies;

  const CardSwiperScreen({super.key, required this.movies});
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if( this.movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height*0.5,
      //color: Colors.red,
      child: Swiper(
        itemCount: this.movies.isEmpty ? 5 : movies.length,
        layout: SwiperLayout.STACK,
        itemHeight: size.height*0.4,
        itemWidth: size.width*0.6,
        itemBuilder: (context, index) { 

          final movie = movies[index];

          movie.heroId = 'swiper-${ movie.id }';

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/no-image.jpg'),
                      image: NetworkImage( movie.fullPosterImg ),
                      fit: BoxFit.cover,
                    ),              
              ),
            ),
          );
        }
        ),
    );
  }
}