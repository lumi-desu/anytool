import 'package:flutter/material.dart';
import 'dart:math';
import 'pages/settings.dart';

// Dark and light background variants to follow system theme
const Color themecolorbgDark = Color(0xFF444444);
const Color themecolorbgLight = Color(0xFFF5F5F5);
const Color themecolorfg = Color.fromARGB(255, 239, 69, 69);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnyTool',
      // follow system setting
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themecolorfg, brightness: Brightness.light),
        scaffoldBackgroundColor: themecolorbgLight,
        appBarTheme: AppBarTheme(backgroundColor: themecolorfg,),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: themecolorfg),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themecolorfg, brightness: Brightness.dark),
        scaffoldBackgroundColor: themecolorbgDark,
        appBarTheme: AppBarTheme(backgroundColor: themecolorfg),
        primaryColor: themecolorfg,
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: themecolorfg, foregroundColor: Colors.white)
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: themecolorfg),
                child: Text('AnyTool', style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        //backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(8),
        child: GridView.count(
          //mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSpacing: 8,
          crossAxisCount: 8,
          crossAxisSpacing: 16,
          //children: <Widget>[
            //(
              children: [
                //SizedBox(width: 10, height: 10, child:
                RawMaterialButton(child: const Icon(Icons.navigate_next), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Tool1(title: 'Yes or No')),);
                }),//),
                //SizedBox(width: 10, height: 10, child:
                RawMaterialButton(child: const Icon(Icons.navigate_next), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Tool2(title: 'Random Number Gen')));
                }),//),
                //SizedBox(width: 10, height: 10, child:
                RawMaterialButton(child: const Icon(Icons.navigate_next), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Tool3(title: 'Whiteboard')));
                }),
                //)
                RawMaterialButton(child: const Icon(Icons.navigate_next), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Tool3(title: 'Coming Soon')));
                }),
              ],
            //),
          //],
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

class Tool1 extends StatefulWidget {
  const Tool1({super.key, required this.title});

  final String title;

  @override
  State<Tool1> createState() => _Tool1();
}

class _Tool1 extends State<Tool1> {
  int _randomn = 0;
  final Random random = Random();

  void generateRamdom() {
    setState(() {
      _randomn = random.nextInt(2);
    });
  }

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
            Text('Your chioce is:', style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
            Text(
              '$_randomn',
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 50),
            ),
            ElevatedButton(onPressed: generateRamdom , child:  const Text('Get choice')),
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

class Tool2 extends StatefulWidget { // 1 thing to change here if copy
  const Tool2({super.key, required this.title}); // and here

  final String title;

  @override
  State<Tool2> createState() => _Tool2(); // 2 things to change here if copy
}

class _Tool2 extends State<Tool2> { // 2 things
  int _randomn = 0;
  final Random random = Random();

  void generateRamdom() {
    setState(() {
      _randomn = random.nextInt(100);
    });
  }

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
            Text('Your random number is:', style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
            Text(
              '$_randomn', style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 50),
            ),
            ElevatedButton(onPressed: generateRamdom , child:  const Text('Get random number')),
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

class Tool3 extends StatefulWidget { // 1 thing to change here if copy
  const Tool3({super.key, required this.title}); // and here

  final String title;

  @override
  State<Tool3> createState() => _Tool3(); // 2 things to change here if copy
}

class _Tool3 extends State<Tool3> { // 2 things

  // store position with its paint properties; null offset marks stroke break
  final List<DrawPoint> points = [];
  bool showTools = false;
  Color selectedColor = Colors.white;
  double strokeWidth = 4.0;
  String mode = 'line'; // 'line' or 'dot'
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          // drawing area
          Positioned.fill(
            child: GestureDetector(
              onPanStart: (details) {
                setState(() {
                  points.add(DrawPoint(details.localPosition, selectedColor, strokeWidth));
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  points.add(DrawPoint(details.localPosition, selectedColor, strokeWidth));
                });
              },
              onPanEnd: (details) {
                setState(() {
                  points.add(DrawPoint(null, selectedColor, strokeWidth)); // stroke break
                });
              },
              child: CustomPaint(
                painter: DrawingPainter(points, mode),
                size: Size.infinite,
              ),
            ),
          ),

          // toolbox FAB (bottom-right)
          Positioned(
            right: 16,
            bottom: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showTools) ...[
                  // color buttons
                  FloatingActionButton.small(
                    heroTag: 'color_red',
                    backgroundColor: Colors.red,
                    onPressed: () => setState(() => selectedColor = Colors.red),
                  ),
                  const SizedBox(height: 8),
                  FloatingActionButton.small(
                    heroTag: 'color_white',
                    backgroundColor: Colors.white,
                    onPressed: () => setState(() => selectedColor = Colors.white),
                  ),
                  const SizedBox(height: 8),
                  // toggle shape/mode
                  FloatingActionButton.small(
                    heroTag: 'mode',
                    onPressed: () => setState(() => mode = (mode == 'line') ? 'dot' : 'line'),
                    //backgroundColor: Colors.grey[200],
                    child: Icon(mode == 'line' ? Icons.brush : Icons.circle),
                  ),
                  const SizedBox(height: 8),
                  // clear
                  FloatingActionButton.small(
                    heroTag: 'clear',
                    onPressed: () => setState(() => points.clear()),
                    child: const Icon(Icons.clear),
                  ),
                  const SizedBox(height: 8),
                ],
                FloatingActionButton(
                  heroTag: 'toolbox',
                  child: const Icon(Icons.build),
                  onPressed: () => setState(() => showTools = !showTools),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// small helper class to keep per-point paint info and stroke separators
class DrawPoint {
  final Offset? offset;
  final Color color;
  final double strokeWidth;
  DrawPoint(this.offset, this.color, this.strokeWidth);
}

class DrawingPainter extends CustomPainter {
  final List<DrawPoint> points;
  final String mode; // 'line' or 'dot'
  DrawingPainter(this.points, this.mode);
  
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length; i++) {
      final p = points[i];
      if (p.offset == null) continue;

      final paint = Paint()
        ..color = p.color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = p.strokeWidth
        ..style = PaintingStyle.stroke;

      if (mode == 'line') {
        // draw continuous lines between non-null neighbors
        if (i < points.length - 1 && points[i + 1].offset != null) {
          canvas.drawLine(p.offset!, points[i + 1].offset!, paint);
        } else {
          // isolated point: draw a small dot
          canvas.drawCircle(p.offset!, p.strokeWidth / 2, paint..style = PaintingStyle.fill);
        }
      } else {
        // 'dot' mode: stamp circles at each point
        final fillPaint = Paint()..color = p.color;
        canvas.drawCircle(p.offset!, p.strokeWidth, fillPaint);
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}
