import 'dart:convert';
import 'package:deck_of_cards/card.dart';
import 'package:http/http.dart' as http;
abstract class DeckCard{
  String deck_id='';
  String shuffleCards='https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1';
  String drawCards='https://deckofcardsapi.com/api/deck//draw/?count=52';
  Future<String> afterShuffle() async{
     var response= await http.get(Uri.parse(shuffleCards));
     if(response.statusCode==200){
      Map<String ,dynamic> deck=jsonDecode(response.body);
      deck_id=deck['deck_id'];
      return deck_id;
     }
     else{
      throw Exception("error : ${response.statusCode}");
     }
  }
 fetch() async{
  String id =await afterShuffle();
    var response =await http.get(Uri.parse('https://deckofcardsapi.com/api/deck/${id}/draw/?count=52'));
    if(response.statusCode==200){
        return jsonDecode(response.body);
    }
    else{
      throw Exception('Error ${response.statusCode}'); 
    }
  }
}
class Decklist extends DeckCard{

  String firstPileName="playerA";
  String secondPileName="playerB";
  List<CardT> cards=[];
  Future<List<CardT>> cardfetch()async{
      final map=await fetch();
      List cards=map['cards'];
      return cards.map((e) => CardT.fromMap(e),).toList();
  }
  
  Future<void> pilesDivide()async{
    String cardsA="";
    String cardsB="";
    cards=await cardfetch();  
    for(int i=0;i<=25;i++){
      cardsA=cardsA+cards[i].code+",";
    }
      var response=await http.get(Uri.parse('https://deckofcardsapi.com/api/deck/${deck_id}/pile/${firstPileName}/add/?cards=$cardsA'));
       if(response.statusCode==200){
      }else{
        throw Exception("error : ${response.statusCode}");
      }
    for(int i=26;i<=51;i++){
      cardsB=cardsB+cards[i].code+",";
    }
      var response1=await http.get(Uri.parse('https://deckofcardsapi.com/api/deck/${deck_id}/pile/${secondPileName}/add/?cards=${cardsB}'));
      if(response1.statusCode==200){
      }else{
        throw Exception("error : ${response1.statusCode}");
      }
    }
  }