import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  final Function(File) onImageSelected;

  ImageSourceSheet({this.onImageSelected});

  final ImagePicker picker = ImagePicker();

  Future<void> editImage(String path, BuildContext context) async {
    final File croppedFile = await ImageCropper.cropImage(
      sourcePath: path,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: "Edit Image",
        toolbarColor: Theme.of(context).primaryColor,
        toolbarWidgetColor: Colors.white,
      ),
      iosUiSettings: const IOSUiSettings(
        title: "Edit Image",
        cancelButtonTitle: 'Cancel',
        doneButtonTitle: "Done",
      ),
    );

    if (croppedFile != null) {
      onImageSelected(croppedFile);
    }
  }

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
              onPressed: () async {
                final PickedFile file =
                    await picker.getImage(source: ImageSource.camera);
                editImage(file.path, context);
              },
              child: const Text(
                'Camera',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                final PickedFile file =
                    await picker.getImage(source: ImageSource.gallery);
                editImage(file.path, context);
              },
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
            onPressed: () async {
              final PickedFile file =
                  await picker.getImage(source: ImageSource.camera);
              editImage(file.path, context);
            },
            child: const Text('Camera'),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              final PickedFile file =
                  await picker.getImage(source: ImageSource.gallery);
              editImage(file.path, context);
            },
            child: const Text('Gallery'),
          )
        ],
      );
    }
  }
}
