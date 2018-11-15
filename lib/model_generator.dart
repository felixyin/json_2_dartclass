import 'package:dart_style/dart_style.dart';
import './helpers.dart';
import './syntax.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

class ModelGenerator {
  final String _rootClassName;
  final bool _privateFields;
  List<ClassDefinition> allClasses = new List<ClassDefinition>();

  ModelGenerator(this._rootClassName, [this._privateFields = false]);

  _generateClassDefinition(String className, Map<String, dynamic> jsonRawData) {
    if (jsonRawData is List) {
      // if first element is an array, start in the first element.
      _generateClassDefinition(className, jsonRawData[0]);
    } else {
      final keys = jsonRawData.keys;
      ClassDefinition classDefinition =
          new ClassDefinition(className, _privateFields);
      keys.forEach((key) {
        final typeDef = new TypeDefinition.fromDynamic(jsonRawData[key]);
        if (typeDef.name == 'Class') {
          typeDef.name = camelCase(key);
        }
        if (typeDef.subtype != null && typeDef.subtype == 'Class') {
          typeDef.subtype = camelCase(key);
        }
        classDefinition.addField(key, typeDef);
      });
      if (allClasses.firstWhere((cd) => cd == classDefinition,
              orElse: () => null) ==
          null) {
        allClasses.add(classDefinition);
      }
      final dependencies = classDefinition.dependencies;
      dependencies.forEach((dependency) {
        if (dependency.typeDef.name == 'List') {
          if (jsonRawData[dependency.name].length > 0) {
            // only generate dependency class if the array is not empty
            _generateClassDefinition(
                dependency.className, jsonRawData[dependency.name][0]);
          }
        } else {
          _generateClassDefinition(
              dependency.className, jsonRawData[dependency.name]);
        }
      });
    }
  }

  /// generateUnsafeDart will generate all classes and append one after another
  /// in a single string. The [rawJson] param is assumed to be a properly
  /// formatted JSON string. The dart code is not validated so invalid dart code
  /// might be returned
  String generateUnsafeDart(String rawJson, {bool isToFiles = false}) {
    final Map<String, dynamic> jsonRawData = decodeJSON(rawJson);
    _generateClassDefinition(_rootClassName, jsonRawData);
    if (isToFiles) {
      // String _currentDir = path.relative('./', from: '/');
      // String _outDir = path.join(_currentDir, 'gen_dart');
      String _outDir = path.absolute('json_2_dartclass');
      Directory outDir = Directory(_outDir);
      if (!outDir.existsSync()) outDir.createSync();
      return allClasses.map((c) {
        String _fileName = getFileName(c);
        String _filePath = path.join(_outDir, _fileName + '.dart');

        File file = File(_filePath);
        if (!file.existsSync()) file.createSync();
        String dartClassStr = c.toString();
        final formatter = new DartFormatter();
        dartClassStr = formatter.format(dartClassStr);
        file.writeAsStringSync(dartClassStr);

        return dartClassStr;
      }).join('\n');
    } else {
      return allClasses.map((c) {
        String s = c.toString();
        final formatter = new DartFormatter();
        return formatter.format(s);
      }).join('\n');
    }
  }

  String getFileName(ClassDefinition c) {
    RegExp re = RegExp(r"([A-Z|\d*]*[a-z|\d*]*)");
    List<String> list =
        re.allMatches(c.name).map((v) => v.group(0).toLowerCase()).toList();
    list.removeWhere((v) => v.isEmpty);
    return list.join('_');
  }

  /// generateDartClasses will generate all classes and append one after another
  /// in a single string. The [rawJson] param is assumed to be a properly
  /// formatted JSON string. If the generated dart is invalid it will throw an error.
  String generateDartClasses(String rawJson, {bool isToFiles = false}) {
    final unsafeDart = generateUnsafeDart(rawJson, isToFiles: isToFiles);
    // final formatter = new DartFormatter();
    // return formatter.format(unsafeDart);
    return unsafeDart;
  }
}
