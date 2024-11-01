import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../obj/product.dart';
import '../provider.dart';
//cart
class CartItem extends StatelessWidget{
  final Product product;
  const CartItem({super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(
              1, 1, 1, 1
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(
                  1, 1, 1, 0.4
              ),
              spreadRadius: 1,
              blurRadius: 3,
            )
          ]
      ),
      child: Center(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Image.asset(
                "assets/images/product1.png",
                width: 70,
                height: 70,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name, style:
                    const TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),),
                    Text("${product.price}", style:
                    const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ],
                ),

              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                onPressed: () {
                    Provider.of<CartModel>(context, listen: false)
                        .deleteProduct(product);
                    },
                    icon: const Icon(CupertinoIcons.xmark, color: Colors.white, size: 20,)),
                Row(
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.add_circle,
                          color: Colors.white, size: 20,)),
                    const Text("1", style: TextStyle(color: Colors.white),),
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.remove_circle,
                          color: Colors.white, size: 20,)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}