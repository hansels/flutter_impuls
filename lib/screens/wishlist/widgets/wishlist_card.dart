import 'package:flutter/material.dart';
import 'package:flutter_impuls/configs/configs.dart';
import 'package:flutter_impuls/models/wishlist/wishlist.dart';
import 'package:flutter_impuls/widgets/custom/custom_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WishlistCard extends StatefulWidget {
  final Wishlist wishlist;

  const WishlistCard({Key key, this.wishlist}) : super(key: key);

  @override
  State<WishlistCard> createState() => _WishlistCardState();
}

class _WishlistCardState extends State<WishlistCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey[300]),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                height: 40,
                width: 80,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Configs.tertiaryColor,
                  ),
                  child: const Center(
                    child: CustomText(
                      "Wishlist",
                      color: Configs.backgroundColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Configs.secondaryColor,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                FontAwesomeIcons.solidHeart,
                                size: 28,
                                color: Configs.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CustomText(
                            widget.wishlist.name,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  LinearProgressIndicator(
                    value: widget.wishlist.progress / widget.wishlist.target,
                    color: const Color.fromARGB(255, 248, 138, 69),
                    backgroundColor: Colors.black12,
                    minHeight: 7.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: CustomText(
                      "Rp.${widget.wishlist.progress.toString()} dari Rp.${widget.wishlist.target.toString()}",
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: CustomText(
                      "Terkumpul",
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
