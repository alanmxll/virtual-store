import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  final String initialText;

  const SearchDialog({this.initialText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2.0,
          left: 4.0,
          right: 4.0,
          child: Card(
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              initialValue: initialText,
              onFieldSubmitted: (text) {
                Navigator.pop(context, text);
              },
              textInputAction: TextInputAction.search,
            ),
          ),
        ),
      ],
    );
  }
}
