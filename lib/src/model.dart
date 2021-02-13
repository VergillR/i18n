part of i18n;

class ClassMeta {
  ClassMeta? parent;
  bool isDefault = true;
  String defaultObjectName = 'messages';
  String defaultFileName = 'fn';
  String objectName = 'messages';
  String localeName = 'en';
  String languageCode = 'en';

  ClassMeta nest(String namePrefix) {
    final result = ClassMeta();
    result.parent = this;
    result.isDefault = isDefault;
    result.defaultObjectName = '$namePrefix$defaultObjectName';
    result.objectName = '$namePrefix$objectName';
    result.localeName = localeName;
    result.languageCode = languageCode;
    return result;
  }
}

class TodoItem {
  ClassMeta meta;
  YamlMap content;

  TodoItem(this.meta, this.content);
}
