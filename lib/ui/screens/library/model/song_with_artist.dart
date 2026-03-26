import '../../../../model/artists/artist.dart';
import '../../../../model/songs/song.dart';

class SongWithArtist {
  final Song song;
  final Artist? artist;
  const SongWithArtist({
    required this.song,
    required this.artist,
  });
  String get artistInfo => artist == null ? '' : '${artist!.name} - ${artist!.genre}';
}