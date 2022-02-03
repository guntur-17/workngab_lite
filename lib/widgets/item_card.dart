import 'package:absen_lite/models/product_model.dart';
import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class ItemCard extends StatefulWidget {
  // const ItemCard({Key? key}) : super(key: key);

  final ProductModel products;
  const ItemCard(this.products, {Key? key}) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  @override
  Widget build(BuildContext context) {
    int hitung = 0;
    // int _counter = 0;
    // void _incrementCounter() {
    //   setState(() {
    //     _counter + 1;
    //   });
    // }

    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return SizedBox(
          width: MediaQuery.of(context).size.width - 60,
          height: sy(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('${widget.products.name}',
                          style: trueBlackTextStyle.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.secondary),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 16,
                        )),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white),
                      child: Text(
                        hitung.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    // IconButton(
                    //     onPressed: () => setState(() {
                    //           _incrementCounter();
                    //         }),
                    //     icon: Icon(Icons.add, color: Colors.white, size: 16)),
                    InkWell(
                        onTap: () {
                          setState(() {
                            hitung++;
                          });
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        )),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
