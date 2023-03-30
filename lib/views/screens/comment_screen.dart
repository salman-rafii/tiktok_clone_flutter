import 'package:flutter/material.dart';
import 'package:tiktok_clone_flutter/utils/constants.dart';
import 'package:tiktok_clone_flutter/views/widgets/custom_text.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage(
                            'https://static.vecteezy.com/system/resources/thumbnails/002/275/847/small/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg'),
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
                      trailing: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.favorite,
                          color: redColor,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const Divider(),
              ListTile(
                title: TextFormField(
                  controller: commentController,
                  style: const TextStyle(fontSize: 16, color: whiteColor),
                  decoration: const InputDecoration(
                    label: CustomText(
                      text: "Comment",
                    ),
                    labelStyle: TextStyle(
                      fontSize: 20.0,
                      color: whiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: redColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: redColor,
                      ),
                    ),
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: const CustomText(
                    text: "Send",
                    fontSize: 16.0,
                    color: whiteColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
