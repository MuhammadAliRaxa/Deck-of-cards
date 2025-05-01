import 'package:flutter/material.dart';
import 'package:deck_of_cards/card.dart';
class ViewCards extends StatelessWidget {
  final List<CardT> list;
  const ViewCards({required this.list,super.key});
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    CardT cards;
    return Scaffold( 
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('Cards',style: TextStyle(color: Colors.amber),),
      ),
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover,image: NetworkImage("https://media.istockphoto.com/id/616006310/vector/abstract-black-background.jpg?s=612x612&w=0&k=20&c=3PE00H-1lD7plLe-5sY62_tvfV2tIxFSZgqIh10Xucg="))
        ),
        child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2 ) ,
             itemBuilder: (context, index) => Padding(padding: EdgeInsets.all(12),child: 
             Image(image: NetworkImage(list[index].image)),),itemCount: 26,),
      )
    );
  }
}