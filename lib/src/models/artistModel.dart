

class Artists {

  
  

  List<Artist> artists = [];  
  
  
  Artists();

  Artists.fromJsonList( Map<String, dynamic> jsonList  ){

 
      final artist = Artist.fromJsonMap(jsonList);
      artists.add(artist);
    }
  }




class Artist {
  int? id;
  String? apiLink;
  String? title;
  String? sortTitle;
  int? birthDate;
  late dynamic birthPlace;
  int? deathDate;
  late dynamic deathPlace;
  late dynamic description;
  late dynamic isLicensingRestricted;
  bool? isArtist;
  int? agentTypeId;
  String? lastUpdatedSource;
  String? lastUpdated;
  String? timestamp;

  Artist({
    required this.id,
    required this.apiLink,
    required this.title,
    required this.sortTitle,
    required this.birthDate,
             this.birthPlace,
    required this.deathDate,
             this.deathPlace,
             this.description,
             this.isLicensingRestricted,
    required this.isArtist,
    required this.agentTypeId,
    required this.lastUpdatedSource,
    required this.lastUpdated,
    required this.timestamp,
  });

  Artist.fromJsonMap( Map<String?, dynamic> json ) {

    

    id = json['id'];
    apiLink  = json['api_link'];
    title  = json['title'];
    sortTitle  = json['sort_title'];
    birthDate  = json['birth_date'];
    birthPlace = json['birth_place'];
    deathDate  = json['death_date'];
    deathPlace = json['death_place'];
    description  = json['description'];
    isLicensingRestricted  = json['is_licensing_restricted'];
    isArtist = json['is_artist'];
    agentTypeId  = json['agent_type_id'];
    lastUpdatedSource  = json['last_updated_source'];
    lastUpdated  = json['last_updated'];
    timestamp  = json['timestamp'];

  }

   getFotoArtist() {

    // ignore: unnecessary_null_comparison
    if ( id == null ) {
      return 'http://forum.spaceengine.org/styles/se/theme/images/no_avatar.jpg';
    } else {
      //return 'https://image.tmdb.org/t/p/w500/$getFotoArtist';
      return 'https://cdn4.iconfinder.com/data/icons/diversity-v2-0-volume-03/64/celebrity-magritte-apple-boler-512.png';
    }

  } 
  
}

