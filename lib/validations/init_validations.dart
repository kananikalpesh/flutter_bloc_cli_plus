import 'dart:io';

import 'package:flutter_bloc_cli_plus/data/constants.dart';
import 'package:flutter_bloc_cli_plus/exception/cli_exception.dart';
import 'package:flutter_bloc_cli_plus/utils/common.dart';
import 'package:flutter_bloc_cli_plus/validations/validations.dart';

class InitValidations extends Validations {
  @override
  Future<void> validate() async {
    await super.validate();
    String path = Directory.current.path;
    bool appDirectoryExist = await checkDirectoryExist("$path${Constants.appDirectoryPath}");
    if (appDirectoryExist) {
      throw CliException(
        message: "Initialization already completed",
      );
    }
  }
}
