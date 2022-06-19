import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_impuls/models/wishlist/wishlist.dart';
import 'package:flutter_impuls/models/wishlist/wishlist_helper.dart';
import 'package:flutter_impuls/widgets/builder/user_builder.dart';
import 'package:flutter_impuls/widgets/custom/custom_text.dart';
import 'package:flutter_impuls/widgets/normal_form_field.dart';
import 'package:flutter_impuls/widgets/custom/custom_dropdown.dart';
import 'package:flutter_impuls/functions/enum_parser.dart';
import 'package:flutter_impuls/enums/item_category.dart';
import 'package:flutter_impuls/widgets/long_raised_button.dart';
import 'package:flutter_impuls/functions/toast_helper.dart';
import 'package:flutter_impuls/functions/routes.dart';

// C:\Users\owen\Documents\GitHub\flutter_impuls\lib\widgets\normal_form_field.dart
class AddWishlistPage extends StatefulWidget {
  const AddWishlistPage({Key key}) : super(key: key);

  @override
  State<AddWishlistPage> createState() => _AddWishlistPageState();
}

class _AddWishlistPageState extends State<AddWishlistPage> {
  Wishlist wishlist;

  WishlistHelper _wishlistHelper;

  @override
  void initState() {
    wishlist = Wishlist(
      id: randomString(),
      progress: 0,
    );
    _wishlistHelper = WishlistHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserBuilder(builder: (user) {
      return SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 10.0),
                child: CustomText(
                  'Nama Barang',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
                child: NormalFormField(
                  hintText: "Masukkan Nama Barang impian kamu",
                  text: wishlist.name,
                  onChanged: (text) {
                    wishlist.name = text;
                  },
                ),
              ),
              const SizedBox(height: 30.0),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 10.0),
                child: CustomText('Kategori Barang',
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
                child: CustomDropdown(
                  hint: "Pilih Kategori Barang kamu",
                  list: [
                    EnumParser.getString(ItemCategory.Edukasi),
                    EnumParser.getString(ItemCategory.Hiburan),
                    EnumParser.getString(ItemCategory.IT),
                    EnumParser.getString(ItemCategory.Kesehatan),
                    EnumParser.getString(ItemCategory.Makanan),
                    EnumParser.getString(ItemCategory.MakeUp),
                  ],
                  selected: wishlist.itemCategory != null
                      ? EnumParser.getString(wishlist.itemCategory)
                      : null,
                  onChanged: (res) {
                    setState(() {
                      wishlist.itemCategory =
                          EnumParser.getEnum(ItemCategory.values, res);
                    });
                  },
                ),
              ),
              const SizedBox(height: 30.0),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 10.0),
                child: CustomText('Target',
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
                child: NormalFormField(
                  text: wishlist.target?.toString(),
                  hintText: "Masukkan Target kamu",
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    wishlist.target = int.parse(text);
                  },
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: LongRaisedButton(
                  dividedBy: 1.2,
                  height: 50,
                  onPressed: () {
                    ToastHelper.show("Wishlist Successfully Added", context);
                    wishlist.userId = user.email;
                    _wishlistHelper.create(wishlist);
                    Routes.pop(context);
                  },
                  // color: ,
                  child: const CustomText(
                    "Simpan",
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }
}
