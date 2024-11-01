import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/rcm_item.dart';
import '../firebase_service.dart';
import '../obj/category.dart';

class HomeView extends StatelessWidget{
  final FirebaseService firebaseService = FirebaseService();
  Color mainColor = Colors.black87;
  @override
  build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black87
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 50,),
                const Center(
                  child: Text("Trang chủ",
                    style:
                    TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.notifications),
                    color: Colors.white, onPressed: () {
                      print(context.toString());
                },
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const TextField(
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,                      // Added this
                  contentPadding: EdgeInsets.all(7),
                  prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: Colors.grey
                  ),
                  hintText: "Tìm kiếm",
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(1, 1, 1, 0.5)),
                      borderRadius: BorderRadius.all(Radius.circular(32.0))
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(32.0))
                  ),
                  fillColor: Color.fromRGBO(
                      1, 1, 1, 0.45), // Màu nền của TextField
                  filled: true,
                ),
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    fontWeight: FontWeight.bold
                ),
                cursorColor: Colors.black,
              ),
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 500,
                child: SingleChildScrollView(
                    child: FutureBuilder<List<Category>>(
                      future: firebaseService.fetchMenuItems(),
                      builder: (context,snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Center(child: Text('No data available'));
                        } else {
                          List<Category> categories = snapshot.data!;
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                for (var category in categories) ...[
                                  SizedBox(height: 8),
                                  RcmItem(label: category.name, product: category.product,),
                                  SizedBox(height: 8),
                                ],
                              ],
                            ),
                          );
                        }
                      },

                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}