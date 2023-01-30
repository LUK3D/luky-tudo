import 'dart:io';

class Utils {
  Future<String> readFile({
    required File configFile,
  }) async {
    try {
      // Read the file
      final contents = await configFile.readAsString();
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return '';
    }
  }
}
