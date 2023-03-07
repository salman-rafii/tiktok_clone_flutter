// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone_flutter/utils/constants.dart';
import 'package:tiktok_clone_flutter/views/screens/confirm_video_screen.dart';
import 'package:tiktok_clone_flutter/views/widgets/custom_text.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      var route =
          MaterialPageRoute(builder: (context) => const ConfirmVideoScreen());
      Navigator.of(context).push(route);
    }
  }

  showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () => pickVideo(ImageSource.gallery, context),
                  child: Row(
                    children: const [
                      Icon(Icons.image),
                      Padding(
                        padding: EdgeInsets.all(7.0),
                        child: CustomText(
                          text: "Gallery",
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () => pickVideo(ImageSource.camera, context),
                  child: Row(
                    children: const [
                      Icon(Icons.camera_alt),
                      Padding(
                        padding: EdgeInsets.all(7.0),
                        child: CustomText(
                          text: "Camera",
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context),
                  child: Row(
                    children: const [
                      Icon(Icons.cancel),
                      Padding(
                        padding: EdgeInsets.all(7.0),
                        child: CustomText(
                          text: "Cancel",
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showOptionsDialog(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            child: const Center(
                child: CustomText(
              text: "Add Video",
              fontSize: 16.0,
            )),
          ),
        ),
      ),
    );
  }
}
