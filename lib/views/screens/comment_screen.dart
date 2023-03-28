import 'package:flutter/material.dart';
import 'package:tiktok_clone_flutter/utils/constants.dart';
import 'package:tiktok_clone_flutter/views/widgets/custom_text.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: NetworkImage('url'),
                  ),
                  title: Row(
                    children: const [
                      CustomText(
                        text: "username",
                        fontSize: 20.0,
                        color: redColor,
                        fontWeight: FontWeight.w700,
                      ),
                      CustomText(
                        text: "comment description",
                        fontSize: 20.0,
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  subtitle: Row(
                    children: const [
                      CustomText(
                        text: "date",
                        fontSize: 12.0,
                        color: whiteColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CustomText(
                        text: "10 likes",
                        fontSize: 12.0,
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
