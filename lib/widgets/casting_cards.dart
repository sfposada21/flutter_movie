import 'package:flutter/material.dart';

class CastinCardScreen extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      margin: EdgeInsets.only(bottom: 40),
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: ( _ , index ) => _CasrCard() ),
    );
  }
}


class _CasrCard extends StatelessWidget {
  const _CasrCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all( 10 ),
      width: 110,
      height: 100,
      child: Column( 
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage( 'https://rockcontent.com/es/wp-content/uploads/sites/3/2019/02/seo-para-ima%CC%81ganes-de-google-1024x538.png.webp' ),
                    fit: BoxFit.cover,
                    height: 110,
                    width: 100,
                  ),  
          ),
          const SizedBox( height: 5),
          const Text(' Sctor.name elmar torner')
        ],
      ),            
    );
  }
}