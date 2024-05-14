// product_item.dart
import 'package:flutter/material.dart';
import 'details.dart';

class ProductItem extends StatelessWidget {
  final ProductDetails product;
  final int count;
  final Function onIncrement;
  final Function onDecrement;

  const ProductItem({
    required this.product,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int price = int.parse(product.price.substring(1));
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Container(
      height: isLandscape ? screenHeight * 0.2 : 120,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              product.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 8, 0, 0),
                    child: Text(
                      product.title,
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 0, 0, 6),
                    child: Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: ' Color: ',
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              TextSpan(
                                text: product.color,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: '   Size: ',
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              TextSpan(
                                text: product.size,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          height: screenWidth * 0.1,
                          width: screenWidth * 0.1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () => onDecrement(),
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          count.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          height: screenWidth * 0.1,
                          width: screenWidth * 0.1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () => onIncrement(),
                              icon: const Icon(
                                Icons.add,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.more_vert, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '\$${price * count}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
