// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:build/build.dart';
import 'package:i18n/src/i18n_impl.dart';

Builder yamlBasedBuilder(BuilderOptions options) => YamlBasedBuilder();

class YamlBasedBuilder implements Builder {
  @override
  Future build(BuildStep buildStep) async {
    // Each [buildStep] has a single input.
    final inputId = buildStep.inputId;

    // Create a new target [AssetId] based on the old one.
    final contents = await buildStep.readAsString(inputId);

    final objectName = generateMessageObjectName(inputId.pathSegments.last);
    final dartContent = generateDartContentFromYaml(objectName, contents);

    final copy = inputId.changeExtension('.dart');

    // Write out the new asset.
    await buildStep.writeAsString(copy, dartContent);
  }

  @override
  final buildExtensions = const {
    '.i18n.yaml': ['.i18n.dart']
  };
}
