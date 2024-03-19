import 'package:demo_project/dark_mode/theme_provider.dart';
import 'package:demo_project/name/text_provider.dart';
import 'package:demo_project/sample.dart';
import 'package:demo_project/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => TextProvider())
      ],
      child: Consumer<ThemeProvider>(builder: (context, theme, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: theme.isDarkMode
              ? ThemeData.dark()
              : ThemeData(
                  cardColor: Colors.purple,
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

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
    var theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Consumer<TextProvider>(builder: (context, tp, _) {
          return Text(tp.title);
        }),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
              child: Container(width: 200, color: Theme.of(context).cardColor),
            ),
            Flexible(
              child: Container(
                width: 200,
                color: Colors.red,
              ),
            ),
            const Text("Test tesxt"),
            Image.network(
                "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.revolverremaps.com%2Fvehicle-coding&psig=AOvVaw2k1qFgEmrAklYR4eTSJyub&ust=1710589733663000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCMi6or2Z9oQDFQAAAAAdAAAAABAE"),
            TextFormField(),
            ElevatedButton(
                onPressed: () {
                  go(context, const SampleScreen());
                },
                child: const Text("Next Screen")),
            Flexible(
              child: Container(
                width: 200,
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          theme.toggleDarkMode();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
