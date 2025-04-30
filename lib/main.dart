import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app.dart';

void main() async {
  // Ensure Flutter binding is initialized first
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  
  // Fix for lifecycle channel issues
  const int defaultBufferSize = 100;
  try {
    // Increase the buffer size for the lifecycle channel
    ServicesBinding.instance.defaultBinaryMessenger.setMessageHandler('flutter/lifecycle', 
      (ByteData? message) async {
        return null;
      }
    );
  } catch (e) {
    // Ignore errors, this is just a precaution
  }
  
  runApp(const EasyPayApp());
}
