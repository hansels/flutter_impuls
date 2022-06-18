extension StringExtensions on String {
  String trimLower() {
    return this.trim().toLowerCase();
  }

  String? nullOrEmptyString() {
    var stringData = this.toString();
    return (stringData?.isEmpty ?? true) ? null : stringData;
  }

  String httpsLower() {
    var regex = RegExp(r"^(https?)(.+)", caseSensitive: false);
    var matches = regex.allMatches(this);
    var data = matches?.first;
    if ((data?.groupCount ?? 0) >= 2) {
      var text = data!.group(1)!.toLowerCase() + data.group(2)!;
      return text;
    }
    return this;
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.toLowerCase().split(" ").map((str) => str.inCaps).join(" ");
  String get onlyAlphanumeric => this.replaceAll(RegExp(r'[^\w\s]+'), "");
}
