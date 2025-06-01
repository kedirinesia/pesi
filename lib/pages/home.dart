import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pesi/main.dart';

class CategoryModel {
  final String name;
  final String iconPath;

  CategoryModel({required this.name, required this.iconPath});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(name: "Fresh Vegetables", iconPath: "assets/icons/brokoli.svg"),
      CategoryModel(name: "Meat", iconPath: "assets/icons/daging.svg"),
      CategoryModel(name: "Frozen Food", iconPath: "assets/icons/frozenFood.svg"),
    ];
  }
}

class RecommendationModel {
  final String name;
  final String iconPath;
  final String info;
  final Color color;

  RecommendationModel({
    required this.name,
    required this.iconPath,
    required this.info,
    required this.color,
  });

  static List<RecommendationModel> getItems() {
    return [
      RecommendationModel(
        name: "Honey Pancake",
        iconPath: "assets/icons/honey-pancakes.svg",
        info: "Easy | 30mins | 180kCal",
        color: const Color(0xffD6E7FF),
      ),
      RecommendationModel(
        name: "Canai Bread",
        iconPath: "assets/icons/canai-bread.svg",
        info: "Easy | 20mins | 140kCal",
        color: const Color(0xffFDE5EC),
      ),
    ];
  }
}

class PopularModel {
  final String name;
  final String iconPath;
  final String info;

  PopularModel({
    required this.name,
    required this.iconPath,
    required this.info,
  });

  static List<PopularModel> getItems() {
    return [
      PopularModel(
        name: "Blueberry Pancake",
        iconPath: "assets/icons/blueberry-pancake.svg",
        info: "Medium | 30mins | 230kCal",
      ),
      PopularModel(
        name: "Salmon Nigiri",
        iconPath: "assets/icons/salmon-nigiri.svg",
        info: "Medium | 25mins | 120kCal",
      ),
    ];
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryModel.getCategories();
    final recommendations = RecommendationModel.getItems();
    final popularItems = PopularModel.getItems();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Fulung Grocery',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/Arrow - Left 2.svg"),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false,
            );
          },
        ),


        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/dots.svg"),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Category',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                final category = categories[index];
                final color = index % 2 == 0
                    ? const Color(0xffD6E7FF)
                    : const Color(0xffFDE5EC);
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        category.iconPath,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category.name,
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Recommendation for Diet',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recommendations.length,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                final item = recommendations[index];
                return Container(
                  width: 200,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: item.color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        item.iconPath,
                        height: 60,
                        width: 60,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.info,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'View',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Popular',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: popularItems.length,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              final item = popularItems[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      item.iconPath,
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.info,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
