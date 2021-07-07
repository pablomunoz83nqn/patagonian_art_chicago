import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/artist_detalle.dart';

import 'package:peliculas/src/pages/home_page.dart';
import 'package:peliculas/src/pages/artwork_detalle.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chicago Art Museum',
      initialRoute: '/',
      routes: {
        '/'       : ( BuildContext context ) => HomePage(),
        'detalle' : ( BuildContext context ) => ArtworkDetalle(),
        'detalleArtista' : ( BuildContext context ) => ArtistDetalle(),
        
      },
    );
  }
}