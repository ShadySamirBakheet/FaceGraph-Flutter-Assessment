import 'dart:io';

import 'package:chairs_factory/presentation/widgets/utils/button.dart';
import 'package:chairs_factory/utils/constants/utils.dart';
import 'package:chairs_factory/utils/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  PickImage({
    Key? key,
    required this.action,
    this.isEnabled = true,
    this.imageLink,
  }) : super(key: key);

  final Function(File?) action;

  final bool isEnabled;
  String? imageLink;

  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File? _image;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(12),
        width: 150,
        height: 150,
        child: GestureDetector(
          onTap: widget.isEnabled ? _getImageSource : null,
          child: CircleAvatar(
            radius: 75,
            backgroundColor: Colors.transparent,
            backgroundImage: widget.imageLink != null
                ? FileImage(File(widget.imageLink ?? ''))
                : _image != null
                    ? FileImage(_image!)
                    : const AssetImage('assets/icons/user.png')
                        as ImageProvider,
          ),
        ),
      ),
    );
  }

  _getImageSource() {
    Scaffold.of(context).showBottomSheet(
      (context) => Container(
        color: AppColor.conColor3l2,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: Divider(
                thickness: 3,
                color: AppColor.conColor3b,
              ),
            ),
            const SizedBox(height: 16),
            ButtonApp(
              title: translate('Camera'),
              action: () => _getImage(source: ImageSource.camera),
            ),
            const SizedBox(height: 16),
            ButtonApp(
              title: translate('Gallery'),
              action: () => _getImage(source: ImageSource.gallery),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  _getImage({ImageSource source = ImageSource.gallery}) async {
    Navigator.of(context).pop();
    //  final PickedFile? pickedFile = await _imagePicker.getImage( source: source, imageQuality: 50, maxHeight: 200);
    final pickedFile = await _imagePicker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        widget.action(_image!);
      }
    });
  }
}
