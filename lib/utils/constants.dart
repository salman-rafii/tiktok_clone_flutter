// COLORS
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone_flutter/controllers/auth_controller.dart';

// pages
const pages = [
  Text("Home Screen"),
  Text("Search Screen"),
  Text("Add Page Screen"),
  Text("Messages Screen"),
  Text("Profile Screen"),
];

// COLORS
const backgroundColor = Colors.black;
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
