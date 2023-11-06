import 'package:flutter/material.dart';
import 'package:green_grocer/src/config/custom_colors.dart';
import 'package:green_grocer/src/models/item_model.dart';
import 'package:green_grocer/src/pages/widgets/quantity_widget.dart';
import 'package:green_grocer/src/services/utils_services.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.item,
  });

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withAlpha(40),
      body: Stack(
        children: [
          // conteúdo
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.item.imageUrl,
                  child: Image.asset(widget.item.imageUrl),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // nome - quantidade
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          QuantityWidget(
                            suffixText: widget.item.unit,
                            value: 1,
                            result: (quantity) {
                              setState(() {
                                cartItemQuantity = quantity;
                              });
                            },
                          ),
                        ],
                      ),
                      // preço
                      Text(
                        utilsServices.priceToCurrency(widget.item.price),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      // descrição
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.description,
                              style: const TextStyle(height: 2),
                            ),
                          ),
                        ),
                      ),
                      // botão
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {},
                          label: const Text(
                            "Add ao carrinho",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon: const Icon(Icons.shopping_cart_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
