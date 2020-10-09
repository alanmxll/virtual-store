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
          SizedBox(
            height: 150.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: section.items.length,
              separatorBuilder: (_, __) {
                return const SizedBox(
                  width: 4.0,
                );
              },
              itemBuilder: (_, int index) {
                return AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.network(
                    section.items[index].image,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
