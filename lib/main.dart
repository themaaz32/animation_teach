import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Implicit Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double width = 200;
  double height = 300;
  double opacity = 0.2;
  double targetValue = 40;

  Color color = Colors.red;

  CrossFadeState state = CrossFadeState.showFirst;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: targetValue),
          duration: Duration(milliseconds: 500),
          builder: (context, size, _){
            return IconButton(
              iconSize: size,
              icon: Icon(Icons.opacity),
              onPressed: (){
                setState(() {
                  targetValue = targetValue == 40 ? 80 : 40;
                });
              },
            );
          },


        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            /*width = width == 200 ? 300 : 200;
            height = height == 300 ? 200 : 300;

            color = color == Colors.red ? Colors.purple : Colors.red;*/
            /*opacity = opacity == 0.2 ? 1.0 : 0.2;*/

            state = state == CrossFadeState.showFirst ? CrossFadeState.showSecond : CrossFadeState.showFirst;
          });

        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
