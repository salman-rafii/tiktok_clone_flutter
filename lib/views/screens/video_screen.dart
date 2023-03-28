import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone_flutter/controllers/video_controller.dart';
import 'package:tiktok_clone_flutter/utils/constants.dart';
import 'package:tiktok_clone_flutter/views/screens/comment_screen.dart';
import 'package:tiktok_clone_flutter/views/widgets/circle_animation.dart';
import 'package:tiktok_clone_flutter/views/widgets/custom_text.dart';
import 'package:tiktok_clone_flutter/views/widgets/video_player_item.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({super.key});
  final VideoController videoController = Get.put(VideoController());
  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            left: 5,
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(profilePhoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  buildMusicAlbum(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(11),
            height: 50,
            width: 60,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.grey,
                    whiteColor,
                  ],
                ),
                borderRadius: BorderRadius.circular(5.0)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(
                  profilePhoto,
                ),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
          itemCount: videoController.videoList.length,
          scrollDirection: Axis.vertical,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          itemBuilder: (context, index) {
            final data = videoController.videoList[index];
            return Stack(
              children: [
                VideoPlayerItem(videoUrl: data.videoUrl),
                Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomText(
                                    text: data.username,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: whiteColor,
                                  ),
                                  CustomText(
                                    text: data.caption,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: whiteColor,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.music_note,
                                        size: 15,
                                        color: whiteColor,
                                      ),
                                      CustomText(
                                        text: data.songName,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: whiteColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            margin: EdgeInsets.only(top: size.height / 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildProfile(data.profilePhoto),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          videoController.likeVideo(data.id),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 40,
                                        color: data.likes.contains(
                                                authController.user.uid)
                                            ? redColor
                                            : whiteColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    CustomText(
                                      text: data.likes.length.toString(),
                                      fontSize: 20.0,
                                      color: whiteColor,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CommentScreen(),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.comment,
                                        size: 40,
                                        color: whiteColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    CustomText(
                                      text: data.commentCount.toString(),
                                      fontSize: 20.0,
                                      color: whiteColor,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.share,
                                        size: 40,
                                        color: whiteColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    CustomText(
                                      text: data.shareCount.toString(),
                                      fontSize: 20.0,
                                      color: whiteColor,
                                    )
                                  ],
                                ),
                                CircleAnimation(
                                  child: buildMusicAlbum(
                                    data.profilePhoto,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        );
      }),
    );
  }
}
