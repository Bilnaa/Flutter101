import '../screens/album_card.dart';
import 'dart:convert';

class FavorisManager {
  static final FavorisManager _instance = FavorisManager._internal();

  factory FavorisManager() {
    return _instance;
  }

  FavorisManager._internal();

  List<Album> favoris = [];

  static void push(Album album) {
    if (!isFavorited(album)) {
      _instance.favoris.add(album);
    }
  }

  static void add(Album album) {
    // check if album is not in favoris list with the title before adding it
    if (!isFavorited(album)) {
      _instance.favoris.add(album);
    }
  }

  static void remove(Album album) {
    // check if album is in favoris list with the title before removing it
    _instance.favoris
        .removeWhere((element) => element.getNomAlbum == album.getNomAlbum);
  }

  static bool isFavorited(Album album) {
    for (Album favori in _instance.favoris) {
      if (favori.getNomAlbum == album.getNomAlbum) {
        return true;
      }
    }
    return false;
  }

  static String exportToJson() {
    return jsonEncode(_instance.favoris);
  }
}
