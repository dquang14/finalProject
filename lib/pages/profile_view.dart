import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget{
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
                const Text("Cá nhân",
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
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 120,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20,),
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.8Rmh5K2_EEG0rHRsOSnJAAHaE8?rs=1&pid=ImgDetMain"),
                    radius: 40,
                  ),
                  SizedBox(width: 10,),
                  Text("dquang14kt", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ))
                ],
              ),
          ),
        ],
      ),
    );
  }

}
