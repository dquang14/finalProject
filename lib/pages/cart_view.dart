import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cart_item.dart';
import '../provider.dart';

class CartView extends StatelessWidget{
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black87
      ),
      child: Column(
        children: [
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new, size: 22, color: Colors.white,)),
                  const Text("Giỏ hàng",
                    style:
                      TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                      ),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.home_filled, size: 22, color:  Colors.white,))
                ],
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text("Tổng: ${cart.totalPrice}đ",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Bo góc nếu muốn
                          ),
                        ),
                        child: const Text(
                          "Đặt hàng",
                          style: TextStyle(
                              color: Colors.black
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListView.builder(
                  itemCount: cart.cartItems.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return CartItem(product: cart.cartItems[index]);
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }

}