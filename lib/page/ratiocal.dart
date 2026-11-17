import 'package:flutter/material.dart';

class RatioCalPage extends StatefulWidget {

  final bool invertText;
  final String title;

  const RatioCalPage({
    super.key,
    required this.invertText,
    required this.title
    });

  @override
  State<RatioCalPage> createState() => _RatioCalPageState();
}

class _RatioCalPageState extends State<RatioCalPage> {
    double inserthere = 0;

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Ratio:', style: TextStyle(color: widget.invertText ? Colors.black : Colors.white)),
            // ScaleTransition(scale: Tween<double>(begin: 1.0, end: 1.7).animate(_animation), child: Text('$_randomn', style: TextStyle(color: widget.invertText ? textanim : Colors.white, fontSize: 50)),),
            // ElevatedButton(onPressed: generateRamdomNumber , child:  const Text('Get choice')),
          ],
        ),
      ),
      
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}