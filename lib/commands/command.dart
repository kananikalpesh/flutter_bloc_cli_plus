import 'package:flutter_bloc_cli_plus/validations/validations.dart';

abstract class Command {
  Command({this.validations});
  final Validations? validations;
  Future<void> execute();
  bool requiredValidate();
}
