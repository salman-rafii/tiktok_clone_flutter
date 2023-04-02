import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone_flutter/controllers/comment_controller.dart';
import 'package:tiktok_clone_flutter/utils/constants.dart';
import 'package:tiktok_clone_flutter/views/widgets/custom_text.dart';

class CommentScreen extends StatefulWidget {
  final String id;
  const CommentScreen({super.key, required this.id});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();
  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(widget.id);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: commentController.comments.length,
                    itemBuilder: ((context, index) {
                      final comment = commentController.comments[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage(comment.profilePhoto),
                        ),
                        title: Row(
                          children: [
                            CustomText(
                              text: comment.username,
                              fontSize: 20.0,
                              color: redColor,
                              fontWeight: FontWeight.w700,
                            ),
                            CustomText(
                              text: comment.comment,
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
                  );
                }),
              ),
              const Divider(),
              ListTile(
                title: TextFormField(
                  controller: _commentController,
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
                  onPressed: () =>
                      commentController.postComment(_commentController.text),
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
