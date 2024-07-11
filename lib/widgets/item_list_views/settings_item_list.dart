import 'package:flutter/material.dart';

class SettingsItemList extends StatelessWidget {
  final String titleSection;
  final List<Widget> bodySection;
  const SettingsItemList({
    Key? key,
    required this.titleSection,
    required this.bodySection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ExpansionTile(
      title: Text(titleSection),
      children: bodySection,
    ));
  }
}
