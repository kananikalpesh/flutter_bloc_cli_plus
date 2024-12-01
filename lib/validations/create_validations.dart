import 'dart:io';

import 'package:flutter_bloc_cli_plus/data/cli_data_provider.dart';
import 'package:flutter_bloc_cli_plus/data/constants.dart';
import 'package:flutter_bloc_cli_plus/exception/cli_exception.dart';
import 'package:flutter_bloc_cli_plus/utils/common.dart';
import 'package:flutter_bloc_cli_plus/utils/file_path_utils.dart';
import 'package:flutter_bloc_cli_plus/validations/validation_messages.dart';
import 'package:flutter_bloc_cli_plus/validations/validations.dart';

class CreateValidations extends Validations {
  CreateValidations({required this.createMultiple});
  final bool createMultiple;

  @override
  Future<void> validate() async {
    await super.validate();
    String path = Directory.current.path;
    bool directoryExist = await checkDirectoryExist("$path${Constants.screensDirectoryPath.actualPath()}");
    if (!directoryExist) {
      throw CliException(message: "${Constants.screensDirectoryPath.actualPath()} Directory not found");
    }
    for (String screenName in CliDataProvider.instance.args.sublist(2)) {
      if (!isValidScreenName(screenName)) {
        throw CliException(message: ValidationMessages.invalidScreenNameMessageString);
      }
    }
  }

  bool isValidScreenName(String name) {
    return RegExp(r'^[a-z][a-z0-9_]*[a-z0-9]$').hasMatch(name);
  }
}
