import 'package:flutter/material.dart';

class CheckoutOrderListWidget extends StatelessWidget {
  const CheckoutOrderListWidget({
    super.key,
    required double w,
  }) : _w = w;

  final double _w;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 60,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "lib/asset/tom-5158824_1280.webp",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          title: const Text("Product Name",
              style: TextStyle(color: Colors.black, fontSize: 20)),
          subtitle: const Row(
            children: [
              Text("₹2999",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold))
              // ElevatedButton(onPressed: onPressed, child: child)
            ],
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_sweep_outlined,
                color: Colors.grey,
              )),
        ),
        margin: EdgeInsets.only(bottom: _w / 20),
        height: _w / 3.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 40,
              spreadRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
