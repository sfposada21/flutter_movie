import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
   
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(      
       body: CustomScrollView(
        slivers: [
          _CustomAppBar( movie: movie ),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle( movie: movie),
              _Overview( movie: movie),
              _Overview( movie: movie),
              CastingCards( movieId: movie.id)
            ]
            )
          )
        ]
      ) 
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  
  final Movie movie;
  
  const _CustomAppBar({required this.movie} );
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.all( 10 ),
          color: Colors.black12,
          child: Text(
              movie.title,
              style: TextStyle( fontSize: 16 ),
              textAlign: TextAlign.center,
            ),
        ),
        background: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage( movie.fullPosterImg  ),
                    fit: BoxFit.cover,
                  ),   
      ),
    );
  }
}


class _PosterAndTitle extends StatelessWidget {

  final Movie movie;  
  const _PosterAndTitle({required this.movie} );
  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only( top: 20 ),
      padding: EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(
        children: [
           Hero(
             tag: movie.heroId!,
             child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                      placeholder: AssetImage('assets/no-image.jpg'),
                      image: NetworkImage( movie.fullPosterImg ),
                      height: 150,
                    ), 
              ),
           ),          
          const SizedBox( width: 20 ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container( 
                width: size.width -180,
                child: Text( movie.title, style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 3 ), ),               
              Container(
                width: size.width -180,
                child: Text( movie.originalTitle , style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2)),
              Row(
                  children: [
                    Icon( Icons.star_outline, size: 15, color: Colors.grey ),
                    SizedBox( width: 5 ),
                    Text( 'puntaje', style: textTheme.caption )
                  ],
                )
              ],
            ),



        
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  final Movie movie;
  
  const _Overview({required this.movie} );  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
