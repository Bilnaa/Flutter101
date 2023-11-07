import 'package:flutter/material.dart';

class Album extends StatelessWidget {
    static const int maxDescriptionLength = 100;
    const Album({Key? key, this.nomAlbum, this.description, this.nomGroupe, this.image}) 
      : super(key: key); 
   final String? nomAlbum; 
   final String? description;
   final String? nomGroupe; 
   final String? image; 
    @override    
   Widget build(BuildContext context) {
    String truncatedDescription =  description!.length > maxDescriptionLength ? "${description!.substring(0, maxDescriptionLength)}..." : description!;
      return Container(
         padding: const EdgeInsets.all(2), height: 120,  child: Card( 
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
               children:<Widget>[
                  Image.asset("images/${image!}"), Expanded(
                     child: 
                     Container(
                        padding: const EdgeInsets.all(5), child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                              children: <Widget>[ 
                              Text(nomAlbum!, style: 
                               const TextStyle(fontWeight: FontWeight.bold)
                              ),
                              Text(truncatedDescription),
                              Text("Groupe: $nomGroupe"), 
                           ], 
                        )
                     )
                  )
               ]
            )
         )
      );
   }
}
