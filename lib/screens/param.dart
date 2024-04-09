import 'package:flutter/material.dart';
import '../screens/album_card.dart';
import '../models/favoris_manager.dart';
import 'package:flutter/services.dart';

class AlbumBody extends StatefulWidget {
  const AlbumBody({Key? key}) : super(key: key);

  @override
  State<AlbumBody> createState() => _AlbumBody();
}

List<Album> albums = [
  const Album(
      nomAlbum: "Metallica",
      description:
          "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock. C'est principalement un album de heavy metal, et il n'y a plus beaucoup de traces de thrash metal ",
      nomGroupe: "Metallica",
      image: "Metallica.jpg"),
  const Album(
      nomAlbum: "Ride the Lightning",
      description:
          "Ride the Lightning est considéré comme l'un des classiques du thrash metal et comme une transition musicale entre les plus débuts de Metallica, Kill 'em All et Master of Puppets, mélodique et progressif",
      nomGroupe: "Metallica",
      image: "Ride the lightning.jpg"),
  const Album(
      nomAlbum: "Master of Puppets",
      description:
          "L'album marque une évolution importante dans le style du groupe.",
      nomGroupe: "Metallica",
      image: "Master of puppets.jpg"),
  const Album(
      nomAlbum: "And Justice for All",
      description:
          "Le titre de l'album est une allusion aux quatre deniers mots du serment d'allégeance au drapeau des Etats-Unis. Les chansons de ...And Justice For All ont pour thèmes la douleur (Harvester of Sorrow), 'injustice (...And Justice for All), la folie (The Frayed Ends of Sanity) et la mort (To Live Is to Die).",
      nomGroupe: "Metallica",
      image: "And justice for all.jpg"),
  const Album(
      nomAlbum: "Kill'em All",
      description:
          "L'album marque une évolution importante dans le style du groupe.",
      nomGroupe: "Metallica",
      image: "Kill'em all.jpg"),
];

List<Album> suggestions = albums;

class _AlbumBody extends State<AlbumBody> {
  FavorisManager favorisManager = FavorisManager();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10),
            child: SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                hintText: "Rechercher un album",
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                onTap: () {
                  controller.openView();
                },
                onChanged: (change) {
                  setState(() {
                    if (change.isEmpty) {
                      suggestions = albums;
                      return;
                    }
                    suggestions = albums.where((element) {
                      return element.getNomAlbum
                          .toLowerCase()
                          .contains(change.toLowerCase());
                    }).toList();
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    suggestions = albums.where((element) {
                      return element.getNomAlbum
                          .toLowerCase()
                          .contains(value.toLowerCase());
                    }).toList();
                  });
                },
                leading: const Icon(Icons.search),
              );
            }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
              return albums.map((album) {
                final String albumName = album.getNomAlbum;
                return ListTile(
                  title: Text(albumName),
                  subtitle: Text(album.getNomGroupe),
                  onTap: () {
                    controller.closeView(albumName);
                    setState(() {
                      suggestions = albums.where((element) {
                        return element.getNomAlbum
                            .toLowerCase()
                            .contains(albumName.toLowerCase());
                      }).toList();
                    });
                  },
                );
              }).toList();
            }),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: suggestions.length,
                itemBuilder: (BuildContext context, int index) {
                  return suggestions[index];
                },
              ),
            ),
          ),
          // FloatingActionButton(
          //     child: const Icon(Icons.file_download),

          //     onPressed: () {
          //       final String json = FavorisManager.exportToJson();
          //       Clipboard.setData(ClipboardData(text: json));

          //       ScaffoldMessenger.of(context).showSnackBar(
          //         const SnackBar(
          //           content: Text('Favoris exportés dans le presse-papier'),
          //           duration: Duration(seconds: 2),
          //         ),
          //       );
          // }),
        ],
      ),
    );
  }
}
