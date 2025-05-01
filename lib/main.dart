import 'package:flutter/material.dart';
import 'package:deck_of_cards/card.dart';
import 'package:deck_of_cards/deck_card.dart';
import 'package:deck_of_cards/game_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading=false;
  Decklist deck=Decklist();
  Future<void> navigate() async{
    setState(() {
      isLoading=true;
    });
    await deck.pilesDivide();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => GamePlay(deck: deck,),));
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('DECK OF CARDS',style: TextStyle(color: Colors.pink,fontStyle: FontStyle.italic),),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover,image: NetworkImage("https://w0.peakpx.com/wallpaper/111/785/HD-wallpaper-faded-background-black-colors-dark-fade-gradient-grey-simple-white.jpg"))
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(child: Image(image: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/008/854/552/small_2x/casino-3d-design-elements-free-png.png'))
              ),
              isLoading?CircularProgressIndicator(semanticsLabel: 'LOading',):SizedBox(),
              SizedBox(height: 200,),
              ElevatedButton(onPressed: (){
                navigate();
              }, child: Text('          PLAY         ',style: TextStyle(fontSize: 20,color: Colors.red,fontStyle: FontStyle.italic),))
            ],
          )
        ),
      )
    );
  }
}
