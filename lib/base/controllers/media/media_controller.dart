import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MediaController {
  Future<File?> onPickImage({required ImageSource type}) async {
    var image = await ImagePicker().pickImage(
      source: type,
      maxWidth: 800,
      maxHeight: 800,
    );
    return File(image!.path);
  }

  Future<File?> onPickVideo({required ImageSource type}) async {
    var video = await ImagePicker().pickVideo(source: type);
    if (video != null) {
      return File(video.path);
    } else {
      return null;
    }
  }

  Future<List<File>?> onPickMultiImagesImagePicker() async {
    var resultList = await ImagePicker().pickMultiImage();
    List<File> images = [];
    for (var element in resultList) {
      images.add(File(element.path));
    }
    return images;
  }
}
