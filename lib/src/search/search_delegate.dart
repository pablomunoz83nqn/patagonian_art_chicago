import 'package:flutter/material.dart';

import 'package:peliculas/src/models/arworksModel.dart';
import 'package:peliculas/src/providers/artworks_provider.dart';


class DataSearch extends SearchDelegate {

  String seleccion = '';
  final artworksProvider = new ArtworksProvider();



  final artworksRecientes = [
    'Spiderman',
    'Capitan America'
  ];
  

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon( Icons.clear ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close( context, null );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    if ( query.isEmpty ) {
      return Container();
    }

    return FutureBuilder(
      future: artworksProvider.buscarArtwork(query),
      builder: (BuildContext context, AsyncSnapshot<List<Artwork>> snapshot) {

          if( snapshot.hasData ) {
            
            final artworks = snapshot.data!;

            return ListView(
              children: artworks.map( (artwork) {
                  return ListTile(
                    leading: Icon(Icons.art_track),
                    subtitle: Text( artwork.title.toString() ),
                    onTap: (){
                      close( context, null);
                      
                      Navigator.pushNamed(context, 'detalle', arguments: artwork);
                    },
                  );
              }).toList()
            );

          } else {
            return Center(
              child: CircularProgressIndicator()
            );
          }

      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe
    if ( query.isEmpty ) {
      return Container();
    }

    return FutureBuilder(
      future: artworksProvider.buscarArtwork(query),
      builder: (BuildContext context, AsyncSnapshot<List<Artwork>> snapshot) {

          if( snapshot.hasData ) {
            
            final artworks = snapshot.data!;

            return ListView(
              children: artworks.map( (artwork) {
                  return ListTile(
                    leading: Icon(Icons.art_track),
                    subtitle: Text( artwork.title.toString() ),
                    onTap: (){
                      close( context, null);
                      
                      Navigator.pushNamed(context, 'detalle', arguments: artwork);
                    },
                  );
              }).toList()
            );

          } else {
            return Center(
              child: CircularProgressIndicator()
            );
          }

      },
    );


  }

 

}

