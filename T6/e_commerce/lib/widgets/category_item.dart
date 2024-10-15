import 'package:flutter/material.dart';
import '../data/category_data.dart';
import '../screens/category_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(category: category.label),
          ),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(category.imagePath),
            radius: 30,
          ),
          Text(
            category.label,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
