import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:funfactory/application/bloc/homescreen_bloc.dart';
import 'package:funfactory/domain/model/product.dart';
import '../../presentation/product_details_screen/screen/product_details.dart';
import 'animated_favorite_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedGridWidget extends StatelessWidget {
  const AnimatedGridWidget({
    super.key,
    required double w,
    required this.columnCount,  this.category = '',
    // required this.searchQuery
  }) : _w = w;

  final double _w;
  final int columnCount;
  final String category;
  // final String searchQuery;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomescreenBloc>(context).add(getproductlist(category: category,));
    });
    return BlocBuilder<HomescreenBloc,HomescreenState>(
      // stream: getProduct(category),
      builder: (context, homescreenState) {

        // if(snapshot!.ConnectionState == ConnectionState.waiting){
        //   return const Expanded(child: Center(child: CircularProgressIndicator(color: Colors.orange,)));
        // }
        // else if(snapshot.hasError){
        //   return Text('Error: ${snapshot.error}');
        // }
        // else if(!snapshot.hasData){
        //   return Text('No Data Available');
        // }
         List<Product>  productDataList =[];
        
        
        if(homescreenState is displayproduct){
           if(homescreenState.isLoading){
            return const CircularProgressIndicator();
           }
  productDataList = homescreenState.productlist;
  // print('productDtaListttttt:$productDataList');
        }

                return Expanded(
        child: AnimationLimiter(
          child: GridView.builder(
            
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columnCount),
                itemCount:productDataList.length,
            padding: EdgeInsets.all(_w / 60),
            // crossAxisCount: columnCount,
            // children: List.generate(
            //   snapshot.data!.length,
              // (int index) {
                itemBuilder: (context, index) {
                  
                  // final productsnap = snapshot.data[index];
                // String imageurl = productsnap.imageUrl[index];
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
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return  ProductDetailsScreen(data: productDataList[index],);
                        }));
                      },
                      child: Container(
                        decoration:  BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage( 
                                 productDataList[index].imageUrl[0]),
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
            // ),
          ),
        ),
      );
        
      },
      
    );
  }
}
