import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';

class FileDownloadHelper {
  void downloadDocument(List<int> bytes) async {
    if (await requestPermission(Permission.storage)) {
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      File file = File(join(documentDirectory.path, "Valor Document.pdf"));
      file.writeAsBytesSync(bytes);
      await saveFile("SIA FECT Dolder", "Valor Document.pdf", file);
    }
  }

  Future<void> saveFile(String folder, String fileName, File file) async {
    Directory directory;

    try {
      bool isPermission = false;
      // handle Android OS 9 <=
      if (await requestPermission(Permission.storage)) {
        isPermission = true;
      }
      // handle Android OS 10
      if (await requestPermission(Permission.accessMediaLocation)) {
        isPermission = true;
      }
      // handle Android OS 11
      if (await requestPermission(Permission.manageExternalStorage)) {
        isPermission = true;
      }
      if (isPermission && Platform.isAndroid) {
        directory = Directory("/storage/emulated/0/Download/SIA FECT Folder/");
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }

        File saveFile = File(directory.path + "/$fileName");
        if (await directory.exists()) {
          var body = await file.readAsBytes();
          await saveFile.writeAsBytes(body);
          await saveFile.create(recursive: true);
        }
      } else if (isPermission && Platform.isIOS) {
        try {
          file.create(recursive: true);
          var body = await file.readAsBytes();
          file.writeAsBytesSync(body);
        } catch (e) {
          print(e);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  String getNormalizeFileName(Directory directory) {
    String newPath = "";
    List<String> paths = directory.path.split("/");
    for (int x = 1; x < paths.length; x++) {
      String folder = paths[x];
      if (folder != "Android") {
        newPath += "/" + folder;
      } else {
        break;
      }
    }
    return newPath;
  }

  Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }
}
