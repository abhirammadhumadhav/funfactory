import 'package:flutter/material.dart';

class InputAddressFormField extends StatelessWidget {
  const InputAddressFormField({
    super.key,
    required this.size,
    this.title,
  });

  final Size size;
  final dynamic title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size.width * 0.9,
          height: size.width * 0.13,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue)),
          child: Row(
            children: [
              SizedBox(
                width: 280,
                height: 30,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      decoration: InputDecoration.collapsed(hintText: title),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
