import 'package:flutter/material.dart';
import 'package:tiktok_clone_flutter/utils/constants.dart';
import 'package:tiktok_clone_flutter/views/widgets/circle_animation.dart';
import 'package:tiktok_clone_flutter/views/widgets/custom_text.dart';
import 'package:tiktok_clone_flutter/views/widgets/video_player_item.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

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
      body: PageView.builder(
        itemCount: 1,
        scrollDirection: Axis.vertical,
        controller: PageController(initialPage: 0, viewportFraction: 1),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              const VideoPlayerItem(videoUrl: ""),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const CustomText(
                                  text: "username",
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor,
                                ),
                                const CustomText(
                                  text: "caption",
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor,
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.music_note,
                                      size: 15,
                                      color: whiteColor,
                                    ),
                                    CustomText(
                                      text: "song name",
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
                              buildProfile('string url'),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.favorite,
                                      size: 40,
                                      color: redColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  const CustomText(
                                    text: "2000",
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
                                      Icons.comment,
                                      size: 40,
                                      color: whiteColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  const CustomText(
                                    text: "2",
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
                                  const CustomText(
                                    text: "3",
                                    fontSize: 20.0,
                                    color: whiteColor,
                                  )
                                ],
                              ),
                              CircleAnimation(
                                  child: buildMusicAlbum('profile photo'))
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
      ),
    );
  }
}
