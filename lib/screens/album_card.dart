import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './one_album.dart';
import '../models/favoris_manager.dart';

class Album extends StatefulWidget {
  static const int maxDescriptionLength = 100;

  const Album({
    Key? key,
    this.nomAlbum,
    this.description,
    this.nomGroupe,
    this.image,
  }) : super(key: key);

  final String? nomAlbum;
  final String? description;
  final String? nomGroupe;
  final String? image;

  get getNomAlbum => nomAlbum;
  get getImage => image;
  get getNomGroupe => nomGroupe;
  get getDescription => description;

  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  late Album _album;
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    _album = Album(
      nomAlbum: widget.nomAlbum,
      description: widget.description,
      nomGroupe: widget.nomGroupe,
      image: widget.image,
    );
    isFavorited = FavorisManager.isFavorited(_album);
  }

  void snackbarMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String truncatedDescription = widget.description!.length > Album.maxDescriptionLength
        ? "${widget.description!.substring(0, Album.maxDescriptionLength)}..."
        : widget.description!;

    return Container(
      padding: const EdgeInsets.all(2),
      height: 120,
      child: GestureDetector(
        onTap: () {
          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.immersive,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OneAlbum(_album),
            ),
          );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  "images/${widget.image!}",
                  width: 80, // Adjust the width as needed
                  height: 80, // Adjust the height as needed
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          widget.nomAlbum!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          truncatedDescription,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text("Groupe: ${widget.nomGroupe}"),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorited = !isFavorited;
                      isFavorited
                          ? FavorisManager.add(_album)
                          : FavorisManager.remove(_album);
                      snackbarMessage(
                        isFavorited
                            ? "Album ajouté aux favoris"
                            : "Album retiré des favoris",
                      );
                    });
                  },
                  icon: isFavorited
                      ? const Icon(Icons.favorite, color: Colors.red)
                      : const Icon(Icons.favorite_border),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
