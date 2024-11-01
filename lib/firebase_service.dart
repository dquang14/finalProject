import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'obj/category.dart';
import 'obj/product.dart';

class FirebaseService {
  final DatabaseReference _menuRef = FirebaseDatabase.instance.ref('menu');
  final _fire = FirebaseDatabase.instance;

  Future<List<Category>> fetchMenuItems() async {
    List<Category> categories = [];

    try {
      final snapshot = await _menuRef.get();
      if (snapshot.exists) {
        // Duyệt qua từng danh mục trong bảng 'menu'
        for (var categorySnapshot in snapshot.children) {
          String categoryName = categorySnapshot.child('category').value as String? ?? "Unknown Category";
          List<Product> products = [];

          // Kiểm tra nếu 'items' tồn tại và có dạng Map
          if (categorySnapshot.child('items').value is Map) {
            // Duyệt qua từng sản phẩm trong danh mục 'items'
            for (var productSnapshot in (categorySnapshot.child('items').value as Map).entries) {
              var productData = Map<String, dynamic>.from(productSnapshot.value);

              // Tạo đối tượng Product từ dữ liệu
              Product product = Product(
                productData['name'] ?? "Unknown Name",
                productData['id'] ?? 0,
                productData['price'] ?? 0,
              );
              products.add(product);
            }
          } else {
            print("Invalid data format for items in category: $categoryName");
          }

          // Tạo đối tượng Category và thêm vào danh sách
          Category category = Category(categoryName, products);
          categories.add(category);
        }
      }
    } catch (e) {
      print("Error reading data from 'menu': $e");
    }
    return categories;
  }
}

