import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HistoryView extends StatelessWidget{
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black87
      ),
      child: Column(
        children: [
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new, size: 22, color: Colors.white,)),
                const Text("Lịch sử",
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
          Expanded(
            //padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
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
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Tổng: 3 sản phẩm", style:
                                    TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    Text("Tổng tiền: 120.000đ", style:
                                    TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    Text("18/10/2024 12:50:40", style:
                                    TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.xmark, color: Colors.white, size: 20,)),
                                IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.eye_fill, color: Colors.white, size: 20,)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }

}