

class Artworks{

  List<Artwork> items = [];
  Artworks();

  Artworks.fromJsonList(List<dynamic> jsonList) {

    

    for ( var item in jsonList) {

      final artwork = new Artwork.fromJsonMap(item);
      items.add(artwork);
    }
  }
}


class Artwork {
   int? id;
   String? apiLink;
   bool? isBoosted;
   String? title;
  late dynamic altTitles;
   String? mainReferenceNumber;
   bool? hasNotBeenViewedMuch;
  late dynamic boostRank;
  int? dateStart;
  int? dateEnd;
   String? dateDisplay;
   String ?dateQualifierId;
   String? artistDisplay;
   String? dimensions;
   String? mediumDisplay;
   dynamic inscriptions;
  String? creditLine;
  late dynamic publicationHistory;
  late dynamic exhibitionHistory;
  late dynamic provenanceText;
   int? internalDepartmentId;
   int? fiscalYear;
   String? fiscalYearDeaccession;
   bool? isPublicDomain;
   bool? isZoomable;
   int? maxZoomWindowSize;
   String? copyrightNotice;
   bool? hasMultimediaResources;
   bool? hasEducationalResources;
   double? colorfulness;
  late dynamic latitude;
  late dynamic longitude;
  late dynamic latlon;
   bool? isOnView;
  late dynamic onLoanDisplay;
   String? galleryTitle;
   int? galleryId;
  late dynamic artworkTypeTitle;
  late dynamic artworkTypeId;
   int? artistId;
   String? artistTitle;
   String? classificationId;
   String? classificationTitle;
   String? subjectId;
   String? materialId;
  late dynamic techniqueId;
   String? imageId;
   String? lastUpdatedSource;
   String? lastUpdated;
   String? timestamp;
  late var thumbnail;

  Artwork({
    required this.id,
    required this.apiLink,
    required this.isBoosted,
    required this.title,
             this.altTitles,
             this.thumbnail,
    required this.mainReferenceNumber,
    required this.hasNotBeenViewedMuch,
             this.boostRank,
    required this.dateStart,
    required this.dateEnd,
    required this.dateDisplay,
    required this.dateQualifierId,
    required this.artistDisplay,
    required this.dimensions,
    required this.mediumDisplay,
             this.inscriptions,
    required this.creditLine,
             this.publicationHistory,
             this.exhibitionHistory,
             this.provenanceText,
    required this.internalDepartmentId,
    required this.fiscalYear,
             this.fiscalYearDeaccession,
    required this.isPublicDomain,
    required this.isZoomable,
    required this.maxZoomWindowSize,
    required this.copyrightNotice,
    required this.hasMultimediaResources,
    required this.hasEducationalResources,
              this.colorfulness,
             this.latitude,
             this.longitude,
             this.latlon,
    required this.isOnView,
             this.onLoanDisplay,
    required this.galleryTitle,
    required this.galleryId,
             this.artworkTypeTitle,
             this.artworkTypeId,
    required this.artistId,
    required this.artistTitle,
    required this.classificationId,
    required this.classificationTitle,
    required this.subjectId,
    required this.materialId,
             this.techniqueId,
    required this.imageId,
    required this.lastUpdatedSource,
    required this.lastUpdated,
    required this.timestamp,
  });

  Artwork.fromJsonMap( Map<String, dynamic> json ) {
    id  = json['id'];
    apiLink  = json['api_link'];
    isBoosted  = json['is_boosted'];
    title  = json['title'];
    altTitles  = json['alt_titles'];
    thumbnail  = json['thumbnail'];
    mainReferenceNumber  = json['main_reference_number'];
    hasNotBeenViewedMuch  = json['has_not_been_viewed_much'];
    boostRank  = json['boost_rank'];
    dateStart  = json['date_starttart'];
    dateEnd  = json['date_end'];
    dateDisplay  = json['date_display'];
    dateQualifierId  = json['date_qualifier_title'];
    artistDisplay  = json['artist_display'];
    dimensions  = json['dimensions'];
    mediumDisplay  = json['medium_display'];
    inscriptions  = json['inscriptions'];
    creditLine  = json['creditLine'];
    publicationHistory  = json['publication_history'];
    exhibitionHistory  = json['exhibition_history'];
    provenanceText  = json['provenance_text'];
    internalDepartmentId  = json['internal_departmentId'];
    fiscalYear  = json['fiscal_year'];
    fiscalYearDeaccession  = json['fiscal_year_deaccession'];
    isPublicDomain  = json['is_public_domain'];
    isZoomable  = json['is_zoomable'];
    maxZoomWindowSize  = json['max_zoom_window_size'];
    copyrightNotice  = json['copyright_notice'];
    hasMultimediaResources  = json['has_multimedia_resources'];
    hasEducationalResources  = json['has_educational_resources'];
   
    latitude  = json['latitude'];
    longitude  = json['longitude'];
    latlon  = json['latlon'];
    isOnView  = json['is_on_view'];
    onLoanDisplay  = json['on_loan_display'];
    galleryTitle  = json['gallery_title'];
    galleryId  = json['gallery_id'];
    artworkTypeTitle  = json['artwork_type_title'];
    artworkTypeId  = json['artwork_type_id'];
    artistId  = json['artist_id'];
    artistTitle  = json['artist_title'];
    classificationId  = json['classification_id'];
    classificationTitle  = json['classification_title'];
    subjectId  = json['subject_id'];
    materialId  = json['material_id'];
    techniqueId  = json['technique_id'];
    imageId  = json['image_id'];
    lastUpdatedSource  = json['last_updated_source'];
    lastUpdated  = json['last_updated'];
    timestamp  = json['timestamp'];
  }

   get uniqueId {
    return '$id-tarjeta';
  }

  get uniqueIdBanner {
    return '$id-banner';
  }

  getPosterImg() {

    if ( imageId == null ) {
      return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgOinP1I4DJR8UXKbif9pXj4UTa1dar-CfGBr4mmSXNfOySMXxPfwa023_n0gvkdK4mig&usqp=CAU';
    } else {
      return 'https://www.artic.edu/iiif/2/$imageId/full/843,/0/default.jpg';
    }

  }

  getBackgroundImg() {

    if ( imageId == null ) {
      return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgOinP1I4DJR8UXKbif9pXj4UTa1dar-CfGBr4mmSXNfOySMXxPfwa023_n0gvkdK4mig&usqp=CAU';
    } else {
      return 'https://www.artic.edu/iiif/2/$imageId/full/843,/0/default.jpg';
    }

  }
}