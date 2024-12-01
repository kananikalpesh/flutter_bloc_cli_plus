import 'dart:io';

import 'package:flutter_bloc_cli_plus/data/constants.dart';
import 'package:flutter_bloc_cli_plus/exception/cli_exception.dart';
import 'package:flutter_bloc_cli_plus/utils/common.dart';
import 'package:flutter_bloc_cli_plus/utils/file_path_utils.dart';

abstract class Validations<T> {
  Future<void> validate() async {
    String path = Directory.current.path;
    List<bool> files = await Future.wait([
      checkFileExist("$path${Constants.pubspecFilePath.actualPath()}"),
      checkFileExist("$path${Constants.mainFilePath.actualPath()}"),
    ]);
    if (!files[0]) {
      throw CliException(
        message: "${Constants.pubspecFilePath.actualPath()} file is not exist",
      );
    }
    if (!files[1]) {
      throw CliException(
        message: "${Constants.mainFilePath.actualPath()} file is not exist",
      );
    }
  }
}
