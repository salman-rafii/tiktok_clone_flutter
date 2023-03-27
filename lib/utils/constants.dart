// COLORS
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone_flutter/controllers/auth_controller.dart';
import 'package:tiktok_clone_flutter/views/screens/add_video_screen.dart';
import 'package:tiktok_clone_flutter/views/screens/video_screen.dart';

// pages
List pages = [
  VideoScreen(),
  const Text("Search Screen"),
  const AddVideoScreen(),
  const Text("Messages Screen"),
  const Text("Profile Screen"),
];
final size = MediaQuery.of(Get.context!).size;
// COLORS
const backgroundColor = Colors.black;
const blackColor = Colors.black;
var buttonColor = Colors.red[400];
const redColor = Colors.red;
const whiteColor = Colors.white;
const borderColor = Colors.grey;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;
