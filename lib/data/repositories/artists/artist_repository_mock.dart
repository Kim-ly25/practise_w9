// artists_repository_mock.dart

import '../../../model/artists/artist.dart';
import 'artist_repository.dart';

class ArtistRepositoryMock implements ArtistRepository {
  final List<Artist> _artists = [
    Artist(
      id: 'a1',
      name: 'VannDa',
      imageUrl: 'https://images.unsplash.com/photo-1511379938547-c1f69419868d',
      genre: 'Hip-Hop',
    ),
    Artist(
      id: 'a2',
      name: 'Tena',
      imageUrl: 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91',
      genre: 'Pop',
    ),
    Artist(
      id: 'a3',
      name: 'G-Devith',
      imageUrl: 'https://images.unsplash.com/photo-1497032205916-ac775f0649ae',
      genre: 'Hip-Hop',
    ),
    Artist(
      id: 'a4',
      name: 'Sokun Nisa',
      imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
      genre: 'Pop',
    ),
    Artist(
      id: 'a5',
      name: 'Ravuth',
      genre: 'Indie',
      imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
    ),
  ];

  @override
  Future<List<Artist>> fetchArtists() async {
    return Future.delayed(const Duration(seconds: 1), () => _artists);
  }

  @override
  Future<Artist?> fetchArtistById(String id) async {
    return Future.delayed(const Duration(seconds: 1), () {
      for (final artist in _artists) {
        if (artist.id == id) {
          return artist;
        }
      }
      return null;
    });
  }
}
