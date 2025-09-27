import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  File? selectedImage;
  File? selectedVideo;
  VideoPlayerController? _videoController;

  final ImagePicker picker = ImagePicker();

  selectImage({required ImageSource source}) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      selectedVideo = null;
      _videoController?.dispose();
      _videoController = null;
    } else {
      selectedImage = null;
    }
    setState(() {});
  }

  selectVideo({required ImageSource source}) async {
    final XFile? video = await picker.pickVideo(source: source);
    if (video != null) {
      selectedVideo = File(video.path);
      selectedImage = null;

      _videoController?.dispose();
      _videoController = VideoPlayerController.file(selectedVideo!)
        ..initialize().then((_) {
          setState(() {});
          _videoController!.play();
          _videoController!.setLooping(true);
        });
    } else {
      selectedVideo = null;
    }
    setState(() {});
  }

  void clearSelection() {
    selectedImage = null;
    selectedVideo = null;
    _videoController?.dispose();
    _videoController = null;
    setState(() {});
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pick Asset",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (selectedImage != null)
                Image.file(selectedImage!, width: 300, height: 300)
              else if (selectedVideo != null &&
                  _videoController != null &&
                  _videoController!.value.isInitialized)
                AspectRatio(
                  aspectRatio: _videoController!.value.aspectRatio,
                  child: VideoPlayer(_videoController!),
                )
              else
                const Text("No Image or Video Selected"),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Pick Image or Video"),
                        actions: [
                          IconButton(
                            onPressed: () async {
                              await selectImage(source: ImageSource.camera);
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.camera_alt),
                          ),
                          IconButton(
                            onPressed: () async {
                              await selectImage(source: ImageSource.gallery);
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.photo_library),
                          ),
                          IconButton(
                            onPressed: () async {
                              await selectVideo(source: ImageSource.camera);
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.videocam),
                          ),
                          IconButton(
                            onPressed: () async {
                              await selectVideo(source: ImageSource.gallery);
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.video_library),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text("Pick Image or Video"),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: clearSelection,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text("Clear Selection",style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
