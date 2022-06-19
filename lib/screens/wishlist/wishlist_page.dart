import 'package:flutter/material.dart';
import 'package:flutter_impuls/functions/token_version.dart';
import 'package:flutter_impuls/models/wishlist/wishlist.dart';
import 'package:flutter_impuls/models/wishlist/wishlist_helper.dart';
import 'package:flutter_impuls/screens/wishlist/widgets/wishlist_card.dart';
import 'package:flutter_impuls/widgets/builder/future_use.dart';
import 'package:flutter_impuls/widgets/builder/stream_use.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key key}) : super(key: key);

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  WishlistHelper _wishlistHelper;

  @override
  void initState() {
    _wishlistHelper = WishlistHelper();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureUse<String>(
      future: TokenVersion.getEmail(),
      builder: (ctx, data) {
        if (data == null || !data.hasData) {
          return Container();
        }

        return StreamUse<Iterable<Wishlist>>(
          stream: _wishlistHelper.getWishlistsStream(data.data),
          builder: (ctx, data) {
            if (data == null || data.hasData) {
              return const Center(
                child: Text("No wishlists here yet."),
              );
            }

            return ListView.builder(
              itemCount: data.data.length,
              itemBuilder: (ctx, index) {
                return WishlistCard(
                  wishlist: data.data.elementAt(index),
                );
              },
            );
          },
        );
      },
    );
  }
}
