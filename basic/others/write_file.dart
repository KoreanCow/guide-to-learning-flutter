import 'dart:io';

void main() {
  File newFile = File('temp_file.txt');
  newFile.createSync();

  File memoFile = File('diary.txt');
  String contents = """
  flutter and dart lang"

  """;
  memoFile.writeAsStringSync(contents);
}
