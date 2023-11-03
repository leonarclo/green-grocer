import 'package:flutter/material.dart';
import 'package:green_grocer/src/config/custom_colors.dart';
import 'package:green_grocer/src/config/app_data.dart' as app_data;
import 'package:green_grocer/src/pages/home/components/item_tile.dart';

import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 30),
            children: [
              TextSpan(
                text: "Green",
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "Grocer",
                style: TextStyle(
                  color: CustomColors.customContrastColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Center(
                  child: Badge(
                    backgroundColor: CustomColors.customContrastColor,
                    label: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: CustomColors.customSwatchColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          // Campo de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  borderSide: BorderSide.none,
                ),
                hintText: "Pesquise aqui...",
                hintStyle: const TextStyle(
                  color: Color.fromARGB(148, 131, 131, 131),
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customContrastColor,
                  size: 21,
                ),
              ),
            ),
          ),

          // Categorias
          Container(
            padding: const EdgeInsets.only(left: 35),
            height: 50,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => CategoryTile(
                      onPressed: () {
                        setState(() {
                          selectedCategory = app_data.categories[index];
                        });
                      },
                      category: app_data.categories[index],
                      isSelected:
                          app_data.categories[index] == selectedCategory,
                    ),
                separatorBuilder: (_, index) => const SizedBox(width: 10),
                itemCount: app_data.categories.length),
          ),

          // Grid View
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
              ),
              itemCount: app_data.items.length,
              itemBuilder: (_, index) {
                return ItemTile(
                  item: app_data.items[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
