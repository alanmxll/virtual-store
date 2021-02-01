import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSourceSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Camera',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Gallery',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return CupertinoActionSheet(
        title: const Text('Select photo for item'),
        message: const Text('Choose the source of the photo'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        actions: <Widget>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {},
            child: const Text('Camera'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {},
            child: const Text('Gallery'),
          )
        ],
      );
    }
  }
}
