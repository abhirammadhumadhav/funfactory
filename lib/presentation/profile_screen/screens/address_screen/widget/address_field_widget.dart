import 'package:flutter/material.dart';

class AddressFieldWidget extends StatelessWidget {
  const AddressFieldWidget({
    super.key,
    required this.size, this.trailbtn,
  });

  final Size size;
  final dynamic trailbtn;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      height: size.width * .25,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: ListTile(
          leading: Container(
            width: size.width * 0.15,
            height: size.width * 0.25,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: const Icon(
              Icons.location_on,
              color: Colors.green,
            ),
          ),
          title: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Home',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "ethalil house,Mankuva Po Thellithode",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5),
                      overflow: TextOverflow.ellipsis),
                )
              ],
            ),
          ),
          trailing: trailbtn,
        ),
      ),
    );
  }
}
