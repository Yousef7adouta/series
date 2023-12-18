/*class Character {
  // late int charId;
  // late String name;
  // late String status;
  // late String species;
  // late String type;
  // late String gender;
  // late String image;
  // late List<dynamic> episode;
  // late String url;
  // late String created;
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;
  List<String>? episode;
  String? url;
  String? created;



  Character.fromJson(Map<String, dynamic> json) {
    // charId = json["id"];
    // name = json["name"];
    // status = json["status"];
    // species = json["species"];
    // type = json["type"];
    // gender = json["gender"];
    // image = json["image"];
    // episode = json["episode"];
    // url = json["url"];
    // created = json["created"];
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    image = json['image'];
    episode = json['episode'].cast<String>();
    url = json['url'];
    created = json['created'];
  }
}
*/

class Character {
 late int? albumId;
 late int? id;
 late String? title;
 late String? url;
 late String? thumbnailUrl;

  

  Character.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  
}
