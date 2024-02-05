import 'dart:io';

class OnboardFile {
  final String code;
  final File? theFile;

  OnboardFile({
    required this.code,
    this.theFile,
  });
}