import 'package:flutter/material.dart';

import '../../../models/section.dart';
import 'item_tile.dart';
import 'section_header.dart';

class SectionList extends StatelessWidget {
  final Section section;

  const SectionList(this.section);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
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
                return ItemTile(
                  section.items[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
