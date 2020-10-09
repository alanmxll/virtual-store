import 'package:flutter/material.dart';

import '../../../models/section.dart';
import 'section_header.dart';

class SectionList extends StatelessWidget {
  final Section section;

  const SectionList(this.section);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(section),
        ],
      ),
    );
  }
}
