
import 'package:flutter/material.dart';

import 'package:peliculas/src/models/arworksModel.dart';



class ArtworkHorizontal extends StatefulWidget {

  final List<Artwork>? artworks;
  final Function siguientePagina;
  final List<Artwork> visitados = [];
  

  ArtworkHorizontal({ required this.artworks, required this.siguientePagina });

  @override
  _ArtworkHorizontalState createState() => _ArtworkHorizontalState();
}

class _ArtworkHorizontalState extends State<ArtworkHorizontal> {

  
  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 1
  );

  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;
    

    _pageController.addListener( () {

      if ( _pageController.position.pixels >= _pageController.position.maxScrollExtent - 400 ){
        widget.siguientePagina();
      }

    });



    return 
       
        Column(
          children: [
            Container(
              height: _screenSize.height * 0.8,
              child: PageView.builder(
                pageSnapping: false,
                controller: _pageController,
                // children: _tarjetas(context),
                itemCount: widget.artworks!.length,
                itemBuilder: ( context, i ) => _tarjeta(context, widget.artworks![i] ),
              ),
            ),
            
          ],
        );
    
    


  }

  
  Widget _tarjeta(BuildContext context, Artwork artwork) {
    
    final _screenSize = MediaQuery.of(context).size;
    
   
    final tarjeta = Container(
        height: _screenSize.height * 0.5,
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          
          children: <Widget>[
            Hero(
              tag: artwork.id.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage( artwork.getPosterImg() ),
                  placeholder:  AssetImage('assets/img/loading.gif'),
                  fit: BoxFit.fill,
                  height: _screenSize.height * 0.5,
                ),
              ),
              
            ),
            SizedBox(height: 5.0),
            Text(
              artwork.title.toString(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
              
            ),
            
          ],
        ),
        
      );
      
      

       
        
         
        
    return GestureDetector(
      child: tarjeta,
      onTap: (){
        
      
        Navigator.pushNamed(context, 'detalle', arguments: artwork );
       
        
        
        print('desde gesture');
        print(artwork.title);
      },
    );
    

  }
  
}
