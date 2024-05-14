// homepage.dart
import 'package:flutter/material.dart';
import 'alert.dart';
import 'details.dart';
import 'product_item.dart';
import 'landscape.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<int> counts = List<int>.filled(products.length, 1);

  @override
  Widget build(BuildContext context) {
    Orientation orientation;
    int totalPrice = 0;
    for (int i = 0; i < products.length; i++) {
      totalPrice += int.parse(products[i].price.substring(1)) * counts[i];
    }
    orientation = MediaQuery.of(context).orientation;
    return OrientationBuilder(
      builder: (context, orientation) {
        if(orientation == Orientation.portrait)
          {
           return Scaffold(
              appBar: AppBar(
                toolbarHeight: 44,
                backgroundColor: Colors.white54,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, size: 30, color: Colors.black87),
                  ),
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "My Bag",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          ProductDetails product = products[index];
                          if (orientation == Orientation.portrait) {
                            return ProductItem(
                              product: product,
                              count: counts[index],
                              onIncrement: () {
                                setState(() {
                                  counts[index]++;
                                  if (counts[index] == 5) {
                                    showCongratulationsAlert(
                                        context, product.title, counts[index]);
                                  }
                                });
                              },
                              onDecrement: () {
                                setState(() {
                                  if (counts[index] > 0) {
                                    counts[index]--;
                                  }
                                });
                              },
                            );
                          } else {
                            return ProductItemLandscape(
                              product: product,
                              count: counts[index],
                              onIncrement: () {
                                setState(() {
                                  counts[index]++;
                                  if (counts[index] == 5) {
                                    showCongratulationsAlert(
                                        context, product.title, counts[index]);
                                  }
                                });
                              },
                              onDecrement: () {
                                setState(() {
                                  if (counts[index] > 0) {
                                    counts[index]--;
                                  }
                                });
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Total amount:",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '\$${totalPrice}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  checkoutElevatedbutton(context,orientation),
                ],
              ),
            );
          }

        else
          {
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 33,
                backgroundColor: Colors.white54,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, size: 30, color: Colors.black87),
                  ),
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: Text(
                      "My Bag",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          ProductDetails product = products[index];
                          if (orientation == Orientation.portrait) {
                            return ProductItem(
                              product: product,
                              count: counts[index],
                              onIncrement: () {
                                setState(() {
                                  counts[index]++;
                                  if (counts[index] == 5) {
                                    showCongratulationsAlert(
                                        context, product.title, counts[index]);
                                  }
                                });
                              },
                              onDecrement: () {
                                setState(() {
                                  if (counts[index] > 0) {
                                    counts[index]--;
                                  }
                                });
                              },
                            );
                          } else {
                            return ProductItemLandscape(
                              product: product,
                              count: counts[index],
                              onIncrement: () {
                                setState(() {
                                  counts[index]++;
                                  if (counts[index] == 5) {
                                    showCongratulationsAlert(
                                        context, product.title, counts[index]);
                                  }
                                });
                              },
                              onDecrement: () {
                                setState(() {
                                  if (counts[index] > 0) {
                                    counts[index]--;
                                  }
                                });
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Total amount:",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '\$${totalPrice}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  checkoutElevatedbutton(context,orientation),
                ],
              ),
            );
          }
      },

    );
  }
}
