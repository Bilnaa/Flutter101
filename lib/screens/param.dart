import 'package:flutter/material.dart';
import '../screens/album.dart';

class ParamBody extends StatefulWidget {
  const ParamBody({Key? key}) : super(key: key);

  @override
  State<ParamBody> createState() => _ParamBody();
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
      description: "L'album marque une évolution importante dans le style du groupe.",
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
      description: "L'album marque une évolution importante dans le style du groupe.",
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




class _ParamBody extends State<ParamBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: 
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: albums.length,
            itemBuilder: (BuildContext context, int index) {
              return albums[index];
            },
          ),
          
        )
    );
  }
}
