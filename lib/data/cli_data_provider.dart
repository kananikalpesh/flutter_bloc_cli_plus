import 'package:flutter_bloc_cli_plus/commands/create_command/bloc_create_auth_screens_command.dart';
import 'package:flutter_bloc_cli_plus/commands/create_command/bloc_create_command.dart';
import 'package:flutter_bloc_cli_plus/commands/create_command/cubit_create_auth_screens_command.dart';
import 'package:flutter_bloc_cli_plus/commands/create_command/cubit_create_command.dart';
import 'package:flutter_bloc_cli_plus/commands/help_command/bloc_help_command.dart';
import 'package:flutter_bloc_cli_plus/commands/help_command/cubit_help_command.dart';
import 'package:flutter_bloc_cli_plus/commands/init_command/boc_init_command.dart';
import 'package:flutter_bloc_cli_plus/commands/init_command/cubit_init_command.dart';
import 'package:flutter_bloc_cli_plus/enums/enums.dart';
import 'package:flutter_bloc_cli_plus/validations/auth_screens_validations.dart';
import 'package:flutter_bloc_cli_plus/validations/create_validations.dart';
import 'package:flutter_bloc_cli_plus/validations/init_validations.dart';

class CliDataProvider {
  static final CliDataProvider _blocCli = CliDataProvider._();
  static CliDataProvider get instance => _blocCli;
  CliDataProvider._();
  List<String> _args = [];
  CodePattern _codePattern = CodePattern.bloc;

  final Map<String, dynamic> _commandData = {
    "cubit": {
      "help": {
        "args_length": 1,
        "has_sub_command": false,
        "command": CubitHelpCommand(),
      },
      "init": {
        "args_length": 1,
        "has_sub_command": false,
        "command": CubitInitCommand(
          validations: InitValidations(),
        ),
      },
      "create": {
        "has_sub_command": true,
        "sub_commands": {
          "screen": {
            "args_length": 3,
            "command": CubitCreateCommand(
              validations: CreateValidations(createMultiple: false),
              createMultiple: false,
            ),
          },
          "screens": {
            "command": CubitCreateCommand(
              validations: CreateValidations(createMultiple: true),
              createMultiple: false,
            ),
          },
          "auth-screens": {
            "command": CubitAuthScreensCommand(
              validations: AuthScreensValidations(),
            ),
          },
        },
      }
    },
    "bloc": {
      "help": {
        "args_length": 1,
        "has_sub_command": false,
        "command": BlocHelpCommand(),
      },
      "init": {
        "args_length": 1,
        "has_sub_command": false,
        "command": BlocInitCommand(
          validations: InitValidations(),
        ),
      },
      "create": {
        "has_sub_command": true,
        "sub_commands": {
          "screen": {
            "args_length": 3,
            "command": BlocCreateCommand(
              validations: CreateValidations(createMultiple: false),
              createMultiple: false,
            ),
          },
          "screens": {
            "command": BlocCreateCommand(
              validations: CreateValidations(createMultiple: true),
              createMultiple: true,
            ),
          },
          "auth-screens": {
            "command": BlocAuthScreensCommand(
              validations: AuthScreensValidations(),
            ),
          },
        }
      }
    }
  };

  set args(List<String> args) {
    if (_args.isNotEmpty) throw "Arguments already initialize";
    _args = args;
  }

  List<String> get args => List.from(_args);

  Map<String, dynamic> get commandData => Map.from(_commandData);

  set codePattern(CodePattern pattern) => _codePattern = pattern;

  CodePattern get codePattern => _codePattern;
}
