import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone_flutter/models/video.dart';
import 'package:tiktok_clone_flutter/utils/constants.dart';

class VideoController extends GetxController {
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);
  List<Video> get videoList => _videoList.value;

  @override
  void onInit() {
    super.onInit();
    _videoList.bindStream(
        firestore.collection('videos').snapshots().map((QuerySnapshot query) {
      List<Video> retValue = [];
      for (var element in query.docs) {
        retValue.add(Video.fromSnap(element));
      }
      return retValue;
    }));
  }
}
