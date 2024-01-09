part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}
class CategoryLoaded extends CategoryState {
  final List<CateItemModel> cateItemList;
  const CategoryLoaded(this.cateItemList);
  @override
  List<Object> get props => [cateItemList];
}

final class ErrorState extends CategoryState{
  final String error;
 const ErrorState(this.error);
  @override
  List<Object> get props=>[error];
}

final class CategoryItemSearchState extends CategoryState{
  final List<CateItemModel> cateItemList;
  const CategoryItemSearchState(this.cateItemList);
  @override
  List<Object> get props => [cateItemList];
}

final class EmptyState extends CategoryState{
  final String str;
  const EmptyState(this.str);
  @override
  List<Object> get props => [str];
}

final  class LoadedBookState extends CategoryState{
  final dynamic file;
const LoadedBookState({required this.file});
  @override
  List<Object> get props => [file];
}

