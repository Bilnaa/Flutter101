import 'package:flutter/material.dart';
import '../models/favoris_manager.dart';
import 'album_card.dart';

class OneAlbum extends StatefulWidget {
  const OneAlbum(this.album, {Key? key}) : super(key: key);
  final Album album;

  @override
  _OneAlbumState createState() => _OneAlbumState();
}

class _OneAlbumState extends State<OneAlbum> {
  late Album thisAlbum;
  late FavorisManager favorisManager;
  late bool isFavorited;

  @override
  void initState() {
    super.initState();
    thisAlbum = widget.album;
    favorisManager = FavorisManager();
    isFavorited = FavorisManager.isFavorited(thisAlbum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(thisAlbum.getNomAlbum!),
            IconButton(
              icon: Icon(
                isFavorited ? Icons.favorite : Icons.favorite_border,
                color: Colors.red, // Couleur de l'icône
              ),
              onPressed: () {
                setState(() {
                  isFavorited = !isFavorited;
                  if (isFavorited) {
                    FavorisManager.add(thisAlbum);
                    snackbarMessage("Album ajouté aux favoris");
                  } else {
                    FavorisManager.remove(thisAlbum);
                    snackbarMessage("Album retiré des favoris");
                  }
                });
              },
            ),
          ],
        ),
      ),
      body: Card(
        elevation: 8.0,
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.green],
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Image.asset(
                    "images/${thisAlbum.getImage!}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    thisAlbum.getNomAlbum!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Artist: ${thisAlbum.nomGroupe}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    thisAlbum.description!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void snackbarMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
