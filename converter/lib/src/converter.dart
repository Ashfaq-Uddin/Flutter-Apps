import 'dart:io';
import 'package:image/image.dart';

ConvertImage(FileSystemEntity selectedFile, String format) {
  final rawImage = (selectedFile as File).readAsBytesSync();

  var newImage;

  final image = decodeImage(rawImage);

  if (format == 'jpg') {
    newImage.encodeJpg(image);
  } else if (format == 'png') {
    newImage.encodeJpg(image);
  } else {
    print('Unsupprted File Type');
  }

  final newPath = replaceExtension(selectedFile.path, format);

  new File(newPath).writeAsBytesSync(newImage);

  return newPath;
}

replaceExtension(String path, String newExtension) {
  return path.replaceAll(new RegExp(r'(png||jpg||jpeg)'), newExtension);
}
