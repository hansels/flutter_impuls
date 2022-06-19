import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_impuls/widgets/custom/custom_text.dart';

class HematCard extends StatefulWidget {
  const HematCard({Key key}) : super(key: key);

  @override
  State<HematCard> createState() => _HematCardState();
}

class _HematCardState extends State<HematCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText('Bulan ini kamu berhemat :',
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(195, 0, 0, 0)),
            RichText(
              text: const TextSpan(
                text: 'Rp. ',
                style: TextStyle(
                    color: Colors.black54, fontSize: 18, fontFamily: "Svenska"),
                children: <InlineSpan>[
                  WidgetSpan(
                      child: SizedBox(
                    width: 20,
                  )),
                  TextSpan(
                    text: '1,354,500',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Svenska"),
                  ),
                ],
              ),
            )
            // RichText(
            //   text: TextSpan(
            //     text: 'Kamu berhemat ',
            //     style: const TextStyle(
            //         color: Colors.black54, fontSize: 15, fontFamily: "Svenska"),
            //     children: <InlineSpan>[
            //       const TextSpan(
            //         text: 'Rp. 1,354,500',
            //         style: const TextStyle(
            //             fontSize: 40,
            //             color: Colors.black87,
            //             fontWeight: FontWeight.bold,
            //             fontFamily: "Svenska"),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
