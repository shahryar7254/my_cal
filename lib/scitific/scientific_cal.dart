import 'package:flutter/material.dart';

class ScientificCal extends StatelessWidget {
  final BuildContext context;

  const ScientificCal({required this.context});

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scientific Calculator'),
      ),
      body: Center(
        child: Text('Your calculator content here'),
      ),
    );
  }
}
