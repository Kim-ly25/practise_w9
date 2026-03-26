import 'package:flutter/material.dart';

import '../../../model/songs/song.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.artist,
    required this.likes,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final String artist;
  final int likes;
  final VoidCallback onTap;

  String get _subtitle {
    final parts = <String>[song.durationInMinutes, artist];
    if (likes != 0) {
      parts.add('$likes likes');
    }
    return parts.join('  ');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(backgroundImage: NetworkImage(song.imageUrl)),
          title: Text(song.title),
          subtitle: Text(_subtitle),
          trailing: Text(
            isPlaying ? "Playing" : "",
            style: TextStyle(color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
