import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(      
       body: CustomScrollView(
        slivers: [
          _CustomAppBar( ),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              CastinCardScreen()
            ]
            )
          )
        ]
      ) 
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  
  const _CustomAppBar( );
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
              'movie.title',
              style: TextStyle( fontSize: 16 ),
              textAlign: TextAlign.center,
            ),
        ),
        background: const FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage( 'https://rockcontent.com/es/wp-content/uploads/sites/3/2019/02/seo-para-ima%CC%81ganes-de-google-1024x538.png.webp' ),
                    fit: BoxFit.cover,
                  ),   
      ),
    );
  }
}


class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only( top: 20 ),
      padding: EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(
        children: [
           ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage( 'https://rockcontent.com/es/wp-content/uploads/sites/3/2019/02/seo-para-ima%CC%81ganes-de-google-1024x538.png.webp' ),
                    height: 150,
                  ), 
            ),          
          const SizedBox( width: 20 ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( 'movie.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2 ),                
              Text( 'movie.originalTitle', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2),
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

  const _Overview();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 30, vertical: 10),
      child: Text(
        'Est cillum nostrud nisi qui. Adipisicing sunt do nisi ullamco. Ullamco aliqua fugiat sit eiusmod nisi ut laborum tempor id reprehenderit. Culpa aliquip magna irure cupidatat minim ut ad irure qui id voluptate deserunt. Veniam minim excepteur et minim. Nulla eu ut adipisicing quis commodo ut ad sunt in incididunt reprehenderit do elit. Dolore sit ut irure consectetur dolore dolor Lorem est ex labore occaecat fugiat anim eu.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
