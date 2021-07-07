import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:peliculas/src/models/artistModel.dart';






class ArtistDetalle extends StatelessWidget {
  


  @override
  Widget build(BuildContext context) {
    

    final Artist artwork = ModalRoute.of(context)!.settings.arguments as Artist;

  
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
               _crearAppbar( artwork, ),
                 SliverList(
                  delegate: SliverChildListDelegate(
                [
                SizedBox( height: 20.0 ),
                

               
              
                _artistTarjeta( artwork)
                
              ]
            ),
          )
        ],
      )
    );
  }


  Widget _crearAppbar( Artist artist ){

    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 50.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          artist.title.toString(),
          style: TextStyle(color: Colors.amber[900], fontSize: 26.0),
        ),
        
      ),
    );

  }

  

  Widget _artistTarjeta( Artist artist ) {
    var history = artist.description;
    
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          
          Text(artist.title.toString(),textAlign: TextAlign.left, style: TextStyle(fontSize: 20.0),  overflow: TextOverflow.ellipsis),
          SizedBox(height: 10.0,),
          Text(
                    (artist.birthDate == null || artist.birthDate== null) ? "Unknow life Dates" :
                    artist.birthDate.toString() + ' - ' + artist.deathDate.toString(), style: TextStyle(backgroundColor: Colors.amber[50])),
          
          SizedBox(height: 10.0,),
          Text('Born in: ' + ((
                    (artist.birthPlace == null) ? "Unknow" :
                    artist.birthPlace.toString())), style: TextStyle(backgroundColor: Colors.amber[50])),
          SizedBox(height: 10.0,),
          Text('Death place: ' + ((
                    (artist.deathPlace == null) ? "Unknow" :
                    artist.deathPlace.toString())), style: TextStyle(backgroundColor: Colors.amber[50])),
          
          SizedBox(height: 20.0,),
          Text('Biography: '),
          Html(
              data: (history == null) ? 'Unknow' : history,
              ),
          
          
        ],
      )
    );
  }


}