import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:deck_of_cards/card.dart';
import 'package:deck_of_cards/deck_card.dart';
import 'package:deck_of_cards/view_cards.dart';
import 'package:http/http.dart' as http;
import 'package:deck_of_cards/deck_card.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
class GamePlay extends StatefulWidget {
  final Decklist deck;
  const GamePlay({required this.deck,super.key});

  @override
  State<GamePlay> createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  int a=0;
  int b=0;
  final controller = FlipCardController();
  final controller1 = FlipCardController();
  String left="https://deckofcardsapi.com/static/img/back.png";
  String right="https://deckofcardsapi.com/static/img/back.png";
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Decklist deck=widget.deck;
   Future<int> draw()async{
    var res=await http.get(Uri.parse('https://deckofcardsapi.com/api/deck/${deck.deck_id}/pile/playerA/draw/random/'));
    if(res.statusCode==200){
      var map =jsonDecode(res.body);
      Map<String,dynamic> card=map['cards'][0];
      var cards=CardT.fromMap(card);
      left=cards.image;
      setState(() {
      });
      controller.flipcard();
      switch(cards.code.characters.first){
        case '1':
        return 1;
        case '2':
        return 2;
        case '3':
        return 3;
        case '4':
        return 4;
        case '5':
        return 5;
        case '6':
        return 6;
        case '7':
        return 7;
        case '8':
        return 8;
        case '9':
        return 9;
        case '0':
        return 10;
        case 'A':
        return 14;
        case 'J':
        return 11;
        case 'Q':
        return 12;
        case 'K':
        return 13;
        default:
        throw Exception("Error : ${cards.code}}");
        
      }
    }
    else{
      throw Exception("Error : ${res.request}");
    }
  }

  Future<int> second()async{
    var response=await http.get(Uri.parse('https://deckofcardsapi.com/api/deck/${deck.deck_id}/pile/playerB/draw/?count=1'));
    if(response.statusCode==200){
      var map =jsonDecode(response.body);
      Map<String,dynamic> card=map['cards'][0];
      var cards=CardT.fromMap(card);
      cards.code.characters.first;
      
      right=cards.image;
      setState(() {
      });
      controller1.flipcard();
      switch(cards.code.characters.first){
        case '1':
        return 1;
        case '2':
        return 2;
        case '3':
        return 3;
        case '4':
        return 4;
        case '5':
        return 5;
        case '6':
        return 6;
        case '7':
        return 7;
        case '8':
        return 8;
        case '9':
        return 9;
        case '10':
        return 10;
        case 'A':
        return 14;
        case 'J':
        return 11;
        case 'Q':
        return 12;
        case 'K':
        return 13;
        default:
        throw Exception("Error : ${cards.code}}");
        
      }
    }
    else{
      throw Exception("Error : ${response.request}");
    }
  }
  Future<String> win() async{
        int s=await draw();
        int d=await second();
        if(s>d){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('"Congratulations, User vistory"' )));
        return "Congratulations , User vistory";
      }
      else if(d>s){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('"Congratulations, ROBOT vistory"' )));
      return "Congratulations , User vistory";
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(' OOh! Draw Match')));
        return "Congratulations , User vistory"; 
      }
    }
    final list=deck.cards;
    var size =MediaQuery.sizeOf(context);
    var Size(:height,:width)=size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Deck of Cards", style: TextStyle(color: Colors.amberAccent),),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover,image: NetworkImage('https://w0.peakpx.com/wallpaper/111/785/HD-wallpaper-faded-background-black-colors-dark-fade-gradient-grey-simple-white.jpg')),
        ),
        child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(children: [Expanded(flex: 8,child: Text("USER",style: TextStyle(color: Colors.white,fontSize: 30),)),
                Expanded(flex:4,child: Text("ROBOT",style: TextStyle(color: Colors.white,fontSize: 30),))],),
                Row(
                  children: [
                    FlipCard(
                      onTapFlipping: false,
                      frontWidget: Container(
                      height: height*0.5,
                      width: width*0.37,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(left))
                      ),
                    ) ,
                     backWidget:  Container(
                      height: height*0.5,
                      width: width*0.37,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage("https://deckofcardsapi.com/static/img/back.png"))
                      ),
                    ),
                    
                      controller:controller, 
                      rotateSide: RotateSide.right),
                    SizedBox(
                      width: width*0.18,
                    ),
                    FlipCard(
                      onTapFlipping: false,
                      frontWidget: Container(
                      height: height*0.5,
                      width: width*0.37,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(right))
                      ),
                    ) ,
                     backWidget:  Container(
                      height: height*0.5,
                      width: width*0.37,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage("https://deckofcardsapi.com/static/img/back.png"))
                      ),
                    ),
                    
                      controller: controller1, 
                      rotateSide: RotateSide.right),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(onPressed: (){
                      List<CardT> list =deck.cards;
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewCards(list: list.sublist(25)),));
                    }, child: Text('View Cards')),
                    SizedBox(
                      width: size.width*0.31,
                    ),
                    ElevatedButton(onPressed: (){
                         Navigator.of(context).push(MaterialPageRoute(builder:(context) => ViewCards(list:deck.cards,), ));
                    }, child: Text('View Cards'))
                  ],
                ),
                SizedBox(
                  height: height*0.1,
                ),
                ElevatedButton(onPressed: (){
                  win();
                }, child: Text('Draw',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.pink))),
                ElevatedButton(onPressed: () { controller.flipcard();
                controller1.flipcard();}, child: Text('Move'))
              ],
            ),
          ),
      )
    );
  }
}
