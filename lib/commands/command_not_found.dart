import 'package:flutter_bloc_cli_plus/commands/command.dart';
import 'package:flutter_bloc_cli_plus/data/cli_data_provider.dart';
import 'package:flutter_bloc_cli_plus/exception/cli_exception.dart';

class CommandNotFound extends Command {
  @override
  Future<void> execute() async {
    throw CliException(message: "Command ${CliDataProvider.instance.args.join(' ')} Not Found");
  }

  @override
  bool requiredValidate() {
    return false;
  }
}
