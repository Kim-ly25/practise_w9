import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../model/artists/artist.dart';
import '../../dtos/artist_dto.dart';
import 'artist_repository.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistsUri = Uri.https('week8-practise-default-rtdb.asia-southeast1.firebasedatabase.app','/artists.json');

  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of artists
      final Map<String, dynamic> artistMap = json.decode(response.body);
      final List<Artist> artists = [];

      for(var entry in artistMap.entries){
        artists.add(ArtistDto.fromJson(entry.value, id: entry.key));
      }
      return artists;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Artist?> fetchArtistById(String id) async {
    final List<Artist> artists = await fetchArtists();

    for (final artist in artists) {
      if (artist.id == id) {
        return artist;
      }
    }

    return null;
  }
}
