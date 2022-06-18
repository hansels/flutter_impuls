import 'package:flutter_impuls/enums/item_category.dart';
import 'package:flutter_impuls/enums/item_type.dart';
import 'package:flutter_impuls/functions/enum_parser.dart';

class Session {
  final String id;
  final String userId;
  final String itemData;
  final ItemType itemType;
  final int itemQuantity;
  final String reason;
  final ItemCategory itemCategory;
  final int itemPrice;
  final int itemRanking;
  final bool isHobby;
  final bool isProfession;

  Session({
    this.id,
    this.userId,
    this.itemData,
    this.itemType,
    this.itemQuantity,
    this.reason,
    this.itemCategory,
    this.itemPrice,
    this.itemRanking,
    this.isHobby,
    this.isProfession,
  });

  static Session fromMap(Map<String, dynamic> data) {
    return data == null
        ? null
        : Session(
            id: data["id"] ?? "",
            userId: data["userId"] ?? "",
            itemData: data["itemData"] ?? "",
            itemType: ItemType.values[data["itemType"]],
            itemQuantity: data["itemQuantity"] ?? 0,
            reason: data["reason"] ?? "",
            itemCategory: EnumParser.getEnum<ItemCategory>(
                ItemCategory.values, data["itemCategory"]),
            itemPrice: data["itemPrice"] ?? 0,
            itemRanking: data["itemRanking"] ?? 0,
            isHobby: data["isHobby"] ?? false,
            isProfession: data["isProfession"] ?? false,
          );
  }

  static List<Session> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "userId": userId,
      "itemData": itemData,
      "itemType": EnumParser.getString(itemType),
      "itemQuantity": itemQuantity,
      "reason": reason,
      "itemCategory": EnumParser.getString(itemCategory),
      "itemPrice": itemPrice,
      "itemRanking": itemRanking,
      "isHobby": isHobby,
      "isProfession": isProfession,
    };
  }
}
