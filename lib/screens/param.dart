import 'package:flutter/material.dart';
import '../screens/album_card.dart';
import '../models/favoris_manager.dart';


class AlbumBody extends StatefulWidget {
  const AlbumBody({Key? key}) : super(key: key);

  @override
  State<AlbumBody> createState() => _AlbumBody();
}

List<Album> albums = [
   const Album(
      nomAlbum: "Metallica",
      description: "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock. C'est principalement un album de heavy metal, et il n'y a plus beaucoup de traces de thrash metal ",
      nomGroupe: "Metallica",
      image: "Metallica.jpg"
  ),
   const Album(
      nomAlbum: "Ride the Lightning",
      description: "Ride the Lightning est considéré comme l'un des classiques du thrash metal et comme une transition musicale entre les plus débuts de Metallica, Kill 'em All et Master of Puppets, mélodique et progressif",
      nomGroupe: "Metallica",
      image: "Ride the lightning.jpg"
  ),
   const Album(
      nomAlbum: "Master of Puppets",
      description: "L'album marque une évolution importante dans le style du groupe.",
      nomGroupe: "Metallica",
      image: "Master of puppets.jpg"
  ),
   const Album(
      nomAlbum: "And Justice for All",
      description: "Le titre de l'album est une allusion aux quatre deniers mots du serment d'allégeance au drapeau des Etats-Unis. Les chansons de ...And Justice For All ont pour thèmes la douleur (Harvester of Sorrow), 'injustice (...And Justice for All), la folie (The Frayed Ends of Sanity) et la mort (To Live Is to Die).",
      nomGroupe: "Metallica",
      image: "And justice for all.jpg"
  ),
  const Album(
    nomAlbum: "Kill'em All",
    description: "L'album marque une évolution importante dans le style du groupe.",
    nomGroupe: "Metallica",
    image: "Kill'em all.jpg"
  ),
];

class _AlbumBody extends State<AlbumBody> {
  FavorisManager favorisManager = FavorisManager();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: albums.length,
          itemBuilder: (BuildContext context, int index) {
            return albums[index];
          },
        ),
      ),
    );
  }
}
