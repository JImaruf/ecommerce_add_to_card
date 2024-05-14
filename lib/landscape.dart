import 'package:flutter/material.dart';
import 'details.dart';

class ProductItemLandscape extends StatelessWidget {
  final ProductDetails product;
  final int count;
  final Function onIncrement;
  final Function onDecrement;

  const ProductItemLandscape({
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

    return Container(
      height: screenHeight * 0.3,
      margin: EdgeInsets.only(left: 10,right: 10,bottom: 5),
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 4, 0, 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(4),
                        height: screenWidth * 0.04,
                        width: screenWidth * 0.04,
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
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          count.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(4),
                        height: screenWidth * 0.04,
                        width: screenWidth * 0.04,
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
                              size: 16,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.more_vert),
                const SizedBox(height: 20),
                Text(
                  '\$${price * count}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.02,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
