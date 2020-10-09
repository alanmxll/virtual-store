import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../models/section.dart';
import 'item_tile.dart';
import 'section_header.dart';

class SectionStaggered extends StatelessWidget {
  final Section section;

  const SectionStaggered(this.section);

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
          StaggeredGridView.countBuilder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            crossAxisCount: 4,
            itemCount: section.items.length,
            itemBuilder: (_, int index) {
              return ItemTile(
                section.items[index],
              );
            },
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(2, index.isEven ? 2 : 1);
            },
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          )
        ],
      ),
    );
  }
}
