import 'package:absen_lite/models/product_model.dart';
import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class ItemCard extends StatefulWidget {
  // const ItemCard({Key? key}) : super(key: key);

  final ProductModel products;
  ItemCard(this.products);

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
        return Container(
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
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).accentColor),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 16,
                        )),
                    // IconButton(
                    //     onPressed: () => setState(() {
                    //           _incrementCounter();
                    //         }),
                    //     icon:
                    //         Icon(Icons.remove, color: Colors.white, size: 16)),
                    // Text(
                    //   '$_counter',
                    //   style: Theme.of(context).textTheme.headline4,
                    // ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white),
                      child: Text(
                        '${hitung.toString()}',
                        style: TextStyle(color: Colors.black, fontSize: 16),
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
                        child: Icon(
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
