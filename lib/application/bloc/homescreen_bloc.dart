// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:funfactory/domain/model/product.dart';
import 'package:funfactory/infrastructure/product.dart';

part 'homescreen_event.dart';
part 'homescreen_state.dart';
part 'homescreen_bloc.freezed.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  HomescreenBloc() : super(const _Initial()) {
    on<getproductlist>((event, emit) {
      final  productstream = getProduct(event.category);
      return emit.forEach(
        productstream,
        
         onData: (data) {
           
           return displayproduct(
             productlist: data,
              isLoading: false
              );
         },
         
      );
    });
  }
}
