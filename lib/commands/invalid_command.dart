import 'package:flutter_bloc_cli_plus/commands/command.dart';
import 'package:flutter_bloc_cli_plus/data/cli_data_provider.dart';
import 'package:flutter_bloc_cli_plus/exception/cli_exception.dart';

class InvalidCommand extends Command {
  @override
  Future<void> execute() async {
    throw CliException(message: "Invalid command: ${CliDataProvider.instance.args.join(' ')}");
  }

  @override
  bool requiredValidate() {
    return true;
  }
}
