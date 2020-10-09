import 'package:flutter/material.dart';

import '../../../models/section.dart';

class SectionHeader extends StatelessWidget {
  final Section section;

  const SectionHeader(this.section);

  @override
  Widget build(BuildContext context) {
    return Text(
      section.name,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 18.0,
      ),
    );
  }
}
