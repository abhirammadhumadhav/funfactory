part of 'homescreen_bloc.dart';

@freezed
class HomescreenState with _$HomescreenState {
  const factory HomescreenState.initial() = _Initial;
  const factory HomescreenState.displayproduct({
    
    required List<Product> productlist,
    required bool isLoading,
  }) = displayproduct;
}
