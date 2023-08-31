part of 'homescreen_bloc.dart';

@freezed
class HomescreenEvent with _$HomescreenEvent {
  const factory HomescreenEvent.getproductlist({required String category,}) = getproductlist;
}