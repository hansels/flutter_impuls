class Wishlist {
  final String id;
  final String userId;
  final String name;
  final int target;
  final int progress;

  Wishlist({
    this.id,
    this.userId,
    this.name,
    this.target,
    this.progress,
  });

  static Wishlist fromMap(Map<String, dynamic> data) {
    return data == null
        ? null
        : Wishlist(
            id: data["id"] ?? "",
            userId: data["userId"] ?? "",
            name: data["name"] ?? "",
            target: data["target"] ?? 0,
            progress: data["progress"] ?? 0,
          );
  }

  static List<Wishlist> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "userId": userId,
      "name": name,
      "target": target,
      "progress": progress,
    };
  }
}
