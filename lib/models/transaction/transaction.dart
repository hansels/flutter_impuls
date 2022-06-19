import 'package:flutter_impuls/enums/item_category.dart';
import 'package:flutter_impuls/functions/enum_parser.dart';

class Transaction {
  String id;
  String userId;
  String name;
  int amount;
  int daySinceLastPurchase;
  ItemCategory category;

  Transaction({
    this.id,
    this.userId,
    this.name,
    this.amount,
    this.daySinceLastPurchase,
    this.category,
  });

  static Transaction fromMap(Map<String, dynamic> data) {
    return data == null
        ? null
        : Transaction(
            id: data["id"] ?? "",
            userId: data["userId"] ?? "",
            name: data["name"] ?? "",
            amount: data["amount"] ?? 0,
            daySinceLastPurchase: data["daySinceLastPurchase"] ?? 0,
            category: EnumParser.getEnum<ItemCategory>(
                ItemCategory.values, data["category"]),
          );
  }

  static List<Transaction> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "userId": userId,
      "name": name,
      "amount": amount,
      "daySinceLastPurchase": daySinceLastPurchase,
      "category": EnumParser.getString<ItemCategory>(category),
    };
  }
}
