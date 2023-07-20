import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../profile_screen/screens/address_screen/widget/address_field_widget.dart';
import '../widget/checkout_order_list.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Expanded(
            child: DefaultTextStyle(
              style: const TextStyle(fontSize: 25),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Checkout',
                      textStyle: GoogleFonts.notoSansOldItalic(
                          textStyle: const TextStyle(
                        color: Colors.orange,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ))),
                ],
                repeatForever: true,
                isRepeatingAnimation: true,
              ),
            ),
          ),
        )),
        backgroundColor: const Color.fromARGB(255, 246, 248, 248),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Shipping Address",
                    style: GoogleFonts.notoSansOldItalic(
                        textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: AddressFieldWidget(
                    size: size,
                    trailbtn: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Order List",
                    style: GoogleFonts.notoSansOldItalic(
                        textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              CheckoutOrderListWidget(w: w),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Amount",
                    style: GoogleFonts.notoSansOldItalic(
                        textStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: size.width * 0.9,
                  height: size.width * 0.45,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Price",
                                style: GoogleFonts.notoSansOldItalic(
                                    textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ))),
                            Text("₹2999",
                                style: GoogleFonts.notoSansOldItalic(
                                    textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                )))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shipping",
                                style: GoogleFonts.notoSansOldItalic(
                                    textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ))),
                            Text("FREE",
                                style: GoogleFonts.notoSansOldItalic(
                                    textStyle: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )))
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total",
                                style: GoogleFonts.notoSansOldItalic(
                                    textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ))),
                            Text("₹2999",
                                style: GoogleFonts.notoSansOldItalic(
                                    textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                )))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 116, 244, 120)),
                        minimumSize: MaterialStateProperty.all(
                            Size(size.width * 0.9, 50))),
                    onPressed: () {},
                    child: const Text(
                      "Continue Payment",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
