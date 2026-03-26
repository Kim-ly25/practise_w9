// song_repository_mock.dart

import '../../../model/songs/song.dart';
import 'song_repository.dart';

class SongRepositoryMock implements SongRepository {
  final List<Song> _songs = [
    Song(
      id: 's1',
      title: 'Mock Song 1',
      artistId: 'Mock Artist',
      imageUrl: Uri.parse('https://images.unsplash.com/photo-1511379938547-c1f69419868d',).toString(),
      duration: const Duration(minutes: 2, seconds: 50),
    ),
    Song(
      id: 's2',
      title: 'Mock Song 2',
      artistId: 'Mock Artist',
      imageUrl: Uri.parse('https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91').toString(),
      duration: const Duration(minutes: 3, seconds: 20),
    ),
    Song(
      id: 's3',
      title: 'Mock Song 3',
      artistId: 'Mock Artist',
      imageUrl: Uri.parse(
        'https://images.unsplash.com/photo-1497032205916-ac775f0649ae',
      ).toString(),
      duration: const Duration(minutes: 3, seconds: 20),
    ),
    Song(
      id: 's4',
      title: 'Mock Song 4',
      artistId: 'Mock Artist',
      imageUrl: Uri.parse('https://images.unsplash.com/photo-1494790108377-be9c29b29330').toString(),
      duration: const Duration(minutes: 3, seconds: 20),
    ),
    Song(
      id: 's5',
      title: 'Mock Song 5',
      artistId: 'Mock Artist',
      imageUrl: Uri.parse('https://images.unsplash.com/photo-1500648767791-00dcc994a43e').toString(),
      duration: const Duration(minutes: 3, seconds: 20),
    ),
  ];

  @override
  Future<List<Song>> fetchSongs() async {
    return Future.delayed(const Duration(seconds: 1), () => _songs);
  }

  @override
  Future<Song?> fetchSongById(String id) async {
    return Future.delayed(Duration(seconds: 1), () {
      return _songs.firstWhere(
        (song) => song.id == id,
        orElse: () => throw Exception("No song with id $id in the database"),
      );
    });
  }
}
