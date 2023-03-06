import 'package:flutter/material.dart';
import 'package:tiktok_clone_flutter/utils/constants.dart';
import 'package:tiktok_clone_flutter/views/widgets/custom_text.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {},
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
