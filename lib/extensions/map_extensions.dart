extension MapExtensions on Map<String, dynamic> {
  String nullOrEmptyString(String key) {
    var stringData = this[key];
    return (stringData?.isEmpty ?? true) ? null : stringData;
  }
}
