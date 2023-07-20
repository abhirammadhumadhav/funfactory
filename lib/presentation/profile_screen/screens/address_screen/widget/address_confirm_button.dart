import 'package:flutter/material.dart';

class AddressConfirmButtonWidget extends StatelessWidget {
  const AddressConfirmButtonWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 10,
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    size.width * 0.1,
                    size.width * .14,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: const Color.fromARGB(255, 189, 241, 191)),
              icon: const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              label: const Text(
                'Confirm',
                style: TextStyle(color: Colors.black, fontSize: 18),
              )),
        ));
  }
}
