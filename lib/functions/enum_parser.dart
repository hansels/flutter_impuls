class EnumParser {
  static T getEnum<T>(List<T> list, String name) {
    try {
      return list.firstWhere((x) => _getName(x.toString()) == name);
    } catch (err) {
      return list.firstWhere((x) => true);
    }
  }

  static List<T> getEnumList<T>(List<T> list, List<dynamic> names) {
    return names == null ? [] : names.map((e) => getEnum(list, e)).toList();
  }

  static String getString<T>(T value) {
    return _getName(value.toString());
  }

  static List<String> getStringList<T>(List<T> values) {
    return values.map((e) => getString(e)).toList();
  }

  static String _getName(String name) {
    var chunks = name.split(".");
    return chunks[1];
  }
}
