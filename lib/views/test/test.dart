import 'package:art_app/extension/context/context.dart';
import 'package:art_app/services/theme/theme.services.dart';
import 'package:flutter/material.dart';

class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        extensions: [CustomTheme.dark()],
      ),
      home: const Test2(),
    );
  }
}

class Test2 extends StatefulWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: Theme.of(context).extension<CustomTheme>()?.bottomBar,
            child: TextField()),
      ),
    );
  }
}
