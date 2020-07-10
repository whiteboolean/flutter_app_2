import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutterapp2/test/RandomWords.dart';

void main() => runApp(new SampleApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
//      home: new RandomWords(),
      home: new Text(
        'I like Flutter!',
        style: new TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

//class  extends StatefulWidget {
//  @override
//  _State createState() => _State();
//}




class SampleApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'sample App',
      theme: new ThemeData(
          primarySwatch: Colors.blue
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) :super(key: key);

  @override
 _SampleAppPageState createState() => new _SampleAppPageState();

}

class _SampleAppPageState extends State<SampleAppPage>{

  String textToShow = "I Like Flutter" ;

   void _updateText(){
    setState(() {
      textToShow = "Flutter is Awesome!" ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new Center(child: new Text(textToShow),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: _updateText,
        tooltip:'Update Text',
        child:new Icon(Icons.update)
      ),

    ) ;

  }

}
