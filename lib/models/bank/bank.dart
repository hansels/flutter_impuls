class Bank {
  String id;
  String name;
  String userId;
  int amount;

  Bank({
    this.id,
    this.name,
    this.userId,
    this.amount,
  });

  static Bank fromMap(Map<String, dynamic> data) {
    return data == null
        ? null
        : Bank(
            id: data["id"] ?? "",
            name: data["name"] ?? "",
            userId: data["userId"] ?? "",
            amount: data["amount"] ?? 0,
          );
  }

  static List<Bank> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "name": name,
      "userId": userId,
      "amount": amount,
    };
  }
}
