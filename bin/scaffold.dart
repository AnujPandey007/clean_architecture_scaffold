import 'dart:io';
import 'package:args/args.dart';

void main(List<String> arguments) {
  try{
    final parser = ArgParser()..addOption('feature', abbr: 'f', help: 'Name of the feature to generate.');

    final results = parser.parse(arguments);

    if (results['feature'] == null) {
      // ignore: avoid_print
      print('Please provide a feature name using -f or --feature');
      exit(1);
    }

    final featureName = results['feature'];
    createCleanArchitectureStructureInLib(featureName);
    createCleanArchitectureStructureInTest(featureName);

    // ignore: avoid_print
    print('Successfully generated Clean Architecture structure for $featureName!');
  }catch(e){
    // ignore: avoid_print
    print(e);
  }
}

void createCleanArchitectureStructureInLib(String featureName) {
  final basePath = 'lib/features/$featureName';

  final directories = [
    '$basePath/data/datasources',
    '$basePath/data/models',
    '$basePath/data/repositories',
    '$basePath/domain/entities',
    '$basePath/domain/repositories',
    '$basePath/domain/usecases',
    '$basePath/presentation/bloc',
    '$basePath/presentation/pages',
    '$basePath/presentation/widgets',
  ];

  for (final directory in directories) {
    Directory(directory).createSync(recursive: true);
  }

  const configPath = 'lib/config';
  Directory(configPath).createSync(recursive: true);

  const utilsPath = 'lib/utils';
  Directory(utilsPath).createSync(recursive: true);
}

void createCleanArchitectureStructureInTest(String featureName) {
  final basePath = 'test/features/$featureName';

  final directories = [
    '$basePath/data/datasources',
    '$basePath/data/models',
    '$basePath/data/repositories',
    '$basePath/domain/entities',
    '$basePath/domain/repositories',
    '$basePath/domain/usecases',
    '$basePath/presentation/bloc',
    '$basePath/presentation/pages',
    '$basePath/presentation/widgets',
  ];

  for (final directory in directories) {
    Directory(directory).createSync(recursive: true);
  }
}


