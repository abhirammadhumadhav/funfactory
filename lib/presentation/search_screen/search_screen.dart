import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:funfactory/domain/model/product.dart';
import 'package:funfactory/infrastructure/search.dart';
import 'package:funfactory/presentation/product_details_screen/screen/product_details.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widget/animated_widgets/animated_favorite_icon.dart';


class SearchScreen extends StatelessWidget {
  // final String query;
   final double _w;
   final String searchQuery;
  const SearchScreen({super.key, required double w, required this.searchQuery}) : _w = w;

  @override
  Widget build(BuildContext context) {
  const int columnCount = 2;
    return Scaffold(
      appBar: AppBar(
         flexibleSpace: Center(
          child: Expanded(
              child: DefaultTextStyle(
            style: const TextStyle(fontSize: 25),
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Your Search',
                    textStyle: GoogleFonts.notoSansOldItalic(
                        textStyle: const TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                    speed: const Duration(milliseconds: 150),
                  ),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
                displayFullTextOnTap: true,
                stopPauseOnTap: false,
              ),
            ),
          )),
        ),
      ),
       body: StreamBuilder<List<Product>>(
        // future: searchInFirebase(query),
        
        stream: SearchProducts(searchQuery, ['Boys','Girls']),
        
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator();
            }if(snapshot.hasError){
              // print('Error:${snapshot.error}');
            }if(!snapshot.hasData || snapshot.data!.isEmpty){
             return const Center(child: Text('No Results Found'));
            }
         final searchResult = snapshot.data;
        //  print('Dataaa :$searchResult');
     
         return GridView.builder(
          itemCount: searchResult!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columnCount),
           itemBuilder: (context, index) {
            
             return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  columnCount: columnCount,
                  child: ScaleAnimation(
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(
                        child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return ProductDetailsScreen(data: searchResult[index]);
                        }));
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (ctx) {
                        //   return  ProductDetailsScreen(data: searchResult.,);
                        // }));
                      },
                      child: Container(
                        decoration:   BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(searchResult[index].imageUrl[0]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20))),
                        margin: EdgeInsets.only(
                            bottom: _w / 30, left: _w / 60, right: _w / 60),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 40,
                                    spreadRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                             const Positioned(
                              top: 10,
                              right: 10,
                              child: AnimatedFavoriteIcon(),
                            ),
                            // Positioned(
                            //   bottom: 15,
                            //   child: Text(productDataList[index].name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)
                            //   ),
                            //   Positioned(
                            //     bottom: 5,
                            //     child: Text(productDataList[index].price,style: TextStyle(color: Colors.green),)
                            //     )
                          ],
                        ),
                      ),
                    )),
                  ),
                );
           },
           );
       },),
    );
  }
}