import 'package:flutter/material.dart';
import 'package:flutter_impuls/widgets/custom/custom_text.dart';

class AddWishlistPage extends StatefulWidget {
  const AddWishlistPage({Key key}) : super(key: key);

  @override
  State<AddWishlistPage> createState() => _AddWishlistPageState();
}

class _AddWishlistPageState extends State<AddWishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // const Padding(
          //   padding: const EdgeInsets.fromLTRB(15.0, 30, 15, 0),
          //   child: Wrap(
          //     spacing: 20,
          //     children: [
          //       Icon(IconData(0xe092,
          //           fontFamily: 'MaterialIcons', matchTextDirection: true)),
          //       CustomText("Tambah Wishlist", fontSize: 32)
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
