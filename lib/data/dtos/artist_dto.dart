import '../../model/artists/artist.dart';

class ArtistDto {
  static const String idKey = 'id';
  static const String nameKey = 'name';
  static const String genreKey = 'genre';
  static const String imageUriKey = 'imageUrl';

  static Artist fromJson(Map<String, dynamic> json, {required String id}) {
    assert(json[nameKey] is String);
    assert(json[genreKey] is String);
    assert(json[imageUriKey] is String);

    return Artist(
      id: id,
      name: json[nameKey],
      genre: json[genreKey],
      imageUrl: json[imageUriKey],
    );
  }

  /// Convert Artist to JSON
  Map<String, dynamic> toJson(Artist artist) {
    return {
      idKey: artist.id,
      nameKey: artist.name,
      genreKey: artist.genre,
      imageUriKey: artist.imageUrl,
    };
  }
}
