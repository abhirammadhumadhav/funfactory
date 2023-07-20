import 'package:flutter/material.dart';
import '../screens/add_new_address_screen.dart';

class AddNewAdressButtonWidget extends StatelessWidget {
  const AddNewAdressButtonWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return const AddNewAddressScreen();
            }));
          },
          style: ElevatedButton.styleFrom(
              minimumSize: Size(
                size.width * 0.1,
                size.width * .14,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: const Color.fromARGB(255, 248, 242, 242)),
          icon: Icon(
            Icons.location_on,
            color: Colors.black.withOpacity(0.3),
          ),
          label: const Text(
            'Add New Address',
            style: TextStyle(color: Colors.black),
          )),
    );
  }
}
