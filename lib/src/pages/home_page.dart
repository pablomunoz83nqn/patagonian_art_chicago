
import 'package:flutter/material.dart';

import 'package:peliculas/src/models/arworksModel.dart';

import 'package:peliculas/src/providers/artworks_provider.dart';
import 'package:peliculas/src/search/search_delegate.dart';

import 'package:peliculas/src/widgets/artwork_horizontal.dart';

class HomePage extends StatelessWidget {

  final artworksProvider = new ArtworksProvider();
 


  @override
  Widget build(BuildContext context) {

   

    artworksProvider.getPopulares();
  

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Chicago Art Museum Online', style: TextStyle(color: Colors.amber[900]),),
        backgroundColor: Colors.amber[50],
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.search, color: Colors.amber[900], size: 35.0, ),
            onPressed: () {
              showSearch(
                context: context, 
                delegate: DataSearch(),
               
                );
            },
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 10,),
        
              _pagination(context),
              SizedBox(height: 10,),
               

            ],
          ),
        ),
      )
       
    );
  }

  


  Widget _pagination(BuildContext context){
    

    return Container(
      width: double.infinity,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Featured Artworks', style: Theme.of(context).textTheme.subtitle1  )
          ),
          SizedBox(height: 5.0),

          StreamBuilder(
            stream: artworksProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              
               if (snapshot.hasError) {
             Text('Error Retrieving information, please reload');
            
               }
          

              if ( snapshot.hasData ) {
                return ArtworkHorizontal( 
                  artworks: snapshot.data as List<Artwork>?,
                  
                  siguientePagina: artworksProvider.getPopulares,
                );
              } else {
                return Center(child: Text('Error Retrieving information, please reload'));
              }
            },
          ),

        ],
      ),
    );


  }


  

}