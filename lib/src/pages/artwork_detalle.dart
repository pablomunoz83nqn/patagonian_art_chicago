
import 'package:flutter/material.dart';
import 'package:peliculas/src/models/artistModel.dart';

import 'package:peliculas/src/models/arworksModel.dart';
import 'package:peliculas/src/providers/artworks_provider.dart';


class ArtworkDetalle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final Artwork artwork = ModalRoute.of(context)!.settings.arguments as Artwork;
   


    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
               _crearAppbar( artwork ),
                 SliverList(
                  delegate: SliverChildListDelegate(
                [
                SizedBox( height: 25.0 ),
                _posterTitulo( context, artwork ),
               
               _descripcion(context, artwork),
               SizedBox(height: 20.0),
                
                _crearCasting( artwork)
              ]
            ),
          )
        ],
      )
    );
  }


  Widget _crearAppbar( Artwork artwork ){

    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 100.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          artwork.title.toString(),
          style: TextStyle(color: Colors.amber[900], fontSize: 14.0),
        ),
        background: Hero(
          tag: artwork.uniqueIdBanner, 
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amberAccent.withOpacity(0.5)
            ),
            child: FadeInImage(
              image: 
              NetworkImage( artwork.getBackgroundImg() ),
              placeholder: AssetImage('assets/img/loading.gif'),
              fadeInDuration: Duration(milliseconds: 150),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );

  }

  Widget _posterTitulo(BuildContext context, Artwork artwork ){
   

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: artwork.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage( artwork.getPosterImg() ),
                height: 80.0,
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Flexible(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(artwork.title.toString(), style: Theme.of(context).textTheme.headline6, overflow: TextOverflow.ellipsis ),
                  SizedBox(height: 10.0,),
                  Text('Year: '+artwork.dateEnd.toString(), style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis ),
                ],
              ),
            ),
          )
        ],
      ),
      
    );
    
  }


  Widget _descripcion(BuildContext context, Artwork artwork ) {

    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
          Text(
            'Artwork History: \n' + ((
                    (artwork.provenanceText == null) ? "No history to tell" :
                    artwork.provenanceText.toString())), style: TextStyle(backgroundColor: Colors.amber[50],
                    )
          ),
          SizedBox(height: 20.0,),
          Text('Relevant dates: \n Created between '+ artwork.dateStart.toString()+ ' and finished '+ artwork.dateEnd.toString()),
         
        ],
      ),

    );


    

  }


  Widget _crearCasting( Artwork artwork ) {
    

    final artworkProvider = new ArtworksProvider();

    return FutureBuilder(
      future: artworkProvider.getArtists(artwork.artistId.toString()),
      builder: (context, AsyncSnapshot<List> snapshot) {
        
          
          if (snapshot.hasError) {
             Text('Error Retrieving information, please reload');
            
          }
          
    
        if( snapshot.hasData ) {
          return _crearArtistasPageView( snapshot.data as List<Artist> );
        } else {
          return Center(child:Text('Sorry anonymous Artist \n no more info to retrieve', style: TextStyle(color: Colors.amber[800]),));
        }
        
      },
    );

  }

  Widget _crearArtistasPageView( List<Artist> artists ) {

    return SizedBox(
      height: 200.0,
      child: 
       PageView.builder(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1
        ),
        itemCount: artists.length,
        itemBuilder: (context, i) =>_artistTarjeta(context, artists[i] ),
      ), 
    );

  }

  Widget _artistTarjeta(BuildContext context, Artist artist ) {
    final artista = Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        
        
        children: <Widget>[
          Text ('Author'),
          ClipRRect(
            
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage( artist.getFotoArtist() ),
              placeholder: AssetImage('assets/img/no-image.jpg'),
              height: 100.0,
              
              fit: BoxFit.cover,
            ), 
          ),
          
          Text(artist.title.toString(), style: TextStyle(fontSize: 15.0),  overflow: TextOverflow.ellipsis),
          SizedBox(height: 5.0,),
          Text('More information', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),)
          
        ],
      )
    );
    return GestureDetector(
      child: artista,
      onTap: (){
        
      
        Navigator.pushNamed(context, 'detalleArtista', arguments: artist );
        
        
      },
    );
    
  }


}