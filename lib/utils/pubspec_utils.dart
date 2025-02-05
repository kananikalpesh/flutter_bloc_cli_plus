import 'dart:io';

import 'package:flutter_bloc_cli_plus/data/constants.dart';
import 'package:flutter_bloc_cli_plus/utils/file_path_utils.dart';
import 'package:pubspec/pubspec.dart';

class PubspecUtils {
  static final PubspecUtils _pubspecUtils = PubspecUtils._();
  static PubspecUtils get instance => _pubspecUtils;
  PubspecUtils._();
  late PubSpec pubSpec;

  Future<void> init() async {
    String path = "${Directory.current.path}${Constants.pubspecFilePath}".actualPath();
    File pubspecFile = File(path);
    String pubspecFileString = await pubspecFile.readAsString();
    pubSpec = PubSpec.fromYamlString(pubspecFileString);
  }

  String get getAppName => pubSpec.name ?? "";
}
