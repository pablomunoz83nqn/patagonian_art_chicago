
import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/artistModel.dart';


import 'dart:convert';
import 'dart:async';


import 'package:peliculas/src/models/arworksModel.dart';



class ArtworksProvider {

 
  String _url      = 'api.artic.edu';
 
  String id = '';

  int _popularesPage = 0;
  bool _cargando     = false;

  List<Artwork> _populares = [];
  

  final _popularesStreamController = StreamController<List<Artwork>>.broadcast();


  Function(List<Artwork>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Artwork>> get popularesStream => _popularesStreamController.stream;


  void disposeStreams() {
    _popularesStreamController.close();
  }

  

  Future<List<Artwork>> _procesarRespuesta(Uri url) async {
    
    final resp = await http.post( url );
    final decodedData = json.decode(resp.body);

    final artworks = new Artworks.fromJsonList(decodedData['data']); //data es el header que viene del  api {"data":{"id"


    return artworks.items;
  }




  Future<List<Artwork>> getPopulares() async {
    
    if ( _cargando ) return [];

    _cargando = true;
    _popularesPage++;

    final url = Uri.https(_url, 'api/v1/artworks', {
     // 'api_key'  : _apikey,
     // 'language' : _language,
     'page'     : _popularesPage.toString()
     
      
    });

    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp);
    popularesSink( _populares );

    _cargando = false;
    return resp;

  }


  

  Future<List>getArtists( String id ) async {

    final url = Uri.https(_url, 'api/v1/agents/$id', {

     
     
    });

   

    final resp = await http.post(url);
    final decodedData = json.decode( resp.body.toString() );

   

    final data = new Artists.fromJsonList(decodedData['data']);
    
    
    return data.artists;
   

  }


  Future<List<Artwork>> buscarArtwork( String q ) async {

    final url = Uri.https(_url, 'api/v1/artworks/search', {
     // 'api_key'  : _apikey,
     // 'language' : _language,
      'q'    : q
    });

    
    return await _procesarRespuesta(url);
    

  }

}

