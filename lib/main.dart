import 'package:flutter/material.dart';
import 'package:mbad_week3_mini_project3/CircleButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedTheme = 'Blue';

  MaterialColor themeColor = Colors.blue;

  void setTheme(themeChosen) {
    print(themeChosen);
    selectedTheme = themeChosen;

    setState(() {
      if (selectedTheme == 'Blue')
        themeColor = Colors.blue;
      else if (selectedTheme == 'Green')
        themeColor = Colors.green;
      else if (selectedTheme == 'Red')
        themeColor = Colors.red;
      else if (selectedTheme == 'Purple')
        themeColor = Colors.purple;
    }); /* once Alt and enter to stateset it cannot hot change anymore need to run green arrow */
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Quicksand",
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch:themeColor,
        ).copyWith(secondary: Colors.amber),
        textTheme: TextTheme(
          headline4: TextStyle(color: Theme.of(context).colorScheme.primary),
          bodyText2: TextStyle(fontSize: 19),
        ).apply(displayColor: themeColor,
        )
      ),
      home: MainScreen(setTheme),
    );
  }
}

class MainScreen extends StatelessWidget {
  Function setTheme;
  MainScreen(this.setTheme);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Theme Picker'), //ctrl space to get the list of space
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Theme Title', style: Theme.of(context).textTheme.headline4),
            Text('Normal text'),
            Text('Some secondary text here', style: TextStyle(color:Theme.of(context).colorScheme.secondary)),
            ElevatedButton(onPressed: () {}, child: Text('Button')),
            Text('Select a Theme', style: Theme.of(context).textTheme.headline5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleButton(setTheme, 'Blue',Colors.blue),
                CircleButton(setTheme, 'Green',Colors.green),
                CircleButton(setTheme, 'Red', Colors.red),
                CircleButton(setTheme, 'Purple', Colors.purple),
              ],
            )
          ],
        ) //we are importing this from lib/widgets/text_widget.dart
    );
  }
}


