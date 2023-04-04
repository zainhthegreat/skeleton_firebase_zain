import 'package:flutter/material.dart';

class SecondScreenUI extends StatefulWidget {
  const SecondScreenUI({Key? key}) : super(key: key);

  @override
  State<SecondScreenUI> createState() => _SecondScreenUIState();
}

class _SecondScreenUIState extends State<SecondScreenUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        automaticallyImplyLeading: true,
      ),
    );
  }
}
