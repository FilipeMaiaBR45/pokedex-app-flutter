import 'package:flutter/material.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [Text(name)]),
    );
  }
}
