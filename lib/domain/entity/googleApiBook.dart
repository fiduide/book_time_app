

class VolumeJson {
  final int totalItems;

  final String kind;

  final List<Item> items;

  VolumeJson({this.items, this.kind, this.totalItems});

  factory VolumeJson.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['items'] as List;

    List<Item> itemList = list.map((i) => Item.fromJson(i)).toList();
    print(itemList.length);

    return VolumeJson(
        items: itemList,
        kind: parsedJson['kind'],
        totalItems: parsedJson['totalItems']);
  }
}

class Item {
  final String kind;

  final String etag;

  final String id;

  final VolumeInfo volumeinfo;

  Item( {this.kind, this.etag, this.id, this.volumeinfo});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
        kind: parsedJson['kind'],
        etag: parsedJson['etag'],
        id: parsedJson['id'],
        volumeinfo: VolumeInfo.fromJson(parsedJson['volumeInfo']));
  }
}

class VolumeInfo {
  final String title;

  final String publisher;

  final String printType;

  final List<Auteur> authors;

  final ImageLinks image;




  VolumeInfo(
      {this.printType, this.title, this.publisher, this.image, this.authors});

  factory VolumeInfo.fromJson(Map<String, dynamic> parsedJson) {

    var list = parsedJson['authors'] as List;

    List<Auteur> auteurList = list.map((i) => Auteur.fromJson(i)).toList();
    print(auteurList.length);

    print('GETTING DATA');
    //print(isbnList[1]);
    return VolumeInfo(
      authors: auteurList,
      title: parsedJson['title'],
      publisher: parsedJson['publisher'],
      printType: parsedJson['printType'],
      image: ImageLinks.fromJson(
        parsedJson['imageLinks'],
      ),

    );
  }
}

class Auteur {
  String auteur;

  Auteur({this.auteur});

  factory Auteur.fromJson(Map<String, dynamic> parsedJson) {
    return Auteur(auteur: parsedJson['thumbnail']);
  }

}

class ImageLinks {
  final String thumb;

  ImageLinks({this.thumb});

  factory ImageLinks.fromJson(Map<String, dynamic> parsedJson) {
    return ImageLinks(thumb: parsedJson['thumbnail']);
  }
}

class ISBN {
  final String iSBN13;
  final String type;

  ISBN({this.iSBN13, this.type});

  factory ISBN.fromJson(Map<String, dynamic> parsedJson) {
    return ISBN(
      iSBN13: parsedJson['identifier'],
      type: parsedJson['type'],
    );
  }
}