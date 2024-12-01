import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:flutter_bloc_cli_plus/commands/command.dart';
import 'package:flutter_bloc_cli_plus/data/cli_data_provider.dart';
import 'package:flutter_bloc_cli_plus/enums/enums.dart';
import 'package:flutter_bloc_cli_plus/exception/cli_exception.dart';
import 'package:flutter_bloc_cli_plus/flutter_bloc_cli_plus.dart';
import 'package:flutter_bloc_cli_plus/utils/pubspec_utils.dart';

void main(List<String> arguments) async {
  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();
  try {
    CliDataProvider.instance.args = arguments;
    CliDataProvider.instance.codePattern = CodePattern.cubit;
    Command command = CliCommand.instance.findCommand();
    if (command.requiredValidate()) {
      await command.validations?.validate();
      await PubspecUtils.instance.init();
    }
    await command.execute();
  } on CliException catch (e) {
    print(red(e.message));
  } on PathNotFoundException catch (e) {
    print(red("File does not exist: ${e.path}"));
  } catch (e) {
    print(red(e.toString()));
  }
  stopwatch.stop();
  print(yellow("Total execution time: ${stopwatch.elapsedMilliseconds} Milliseconds\n"));
}
