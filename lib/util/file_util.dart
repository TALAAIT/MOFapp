import 'dart:io';
import 'package:file_picker/file_picker.dart';


/// Prompt the usr to pick a pdf file using the file picker library.
/// Returns the selected [File] path object if a file is picked, or `null` if the picking process is canceled.


class FileUtil {
  Future<File?> pickedFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if(result != null) {
      return File(result.files.single.path!);
    } else {
      return null;
    }
  }
}
