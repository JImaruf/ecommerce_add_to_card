import 'package:flutter/material.dart';

void showCongratulationsAlert(BuildContext context, String title, int count) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(
          child: Text(
            "Congratulations!",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            "You have added \n$count \n${title} in your bag!",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        actions: [
          Container(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFDB3022)),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                // minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text("OKAY"),
              ),
            ),
          ),
        ],
      );
    },
  );
}

void showCheckoutSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Congratulations! You have successfully checked out.'),
    ),
  );
}

Widget checkoutElevatedbutton(BuildContext context, Orientation orientation) {
  double screenWidth = MediaQuery.of(context).size.width;

    if(orientation==Orientation.portrait)
      {
        return  Container(
          height: 70,
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFFDB3022)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              minimumSize:
              MaterialStateProperty.all<Size>(Size(screenWidth * 0.8, 50)),
            ),
            onPressed: () {
              showCheckoutSnackbar(context);
            },
            child: const Text(
              "CHECK OUT",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    else
      {
        return  Container(
          padding: EdgeInsets.only(left: 10,right: 10,bottom: 3),
          height: 35,
          width: double.infinity,
          child: ElevatedButton(

            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFFDB3022)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              minimumSize:
              MaterialStateProperty.all<Size>(Size(screenWidth * 0.8, 10)),
            ),
            onPressed: () {
              showCheckoutSnackbar(context);
            },
            child: const Text(
              "CHECK OUT",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }

}