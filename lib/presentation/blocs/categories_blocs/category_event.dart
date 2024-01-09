part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

// final class TakeCategoryEvent extends CategoryEvent{
//   @override
//   List<Object?> get props => [];
//
// }
final class TakeCategoryItemEvent extends CategoryEvent{
  final int id;
  const TakeCategoryItemEvent(this.id);
  @override
  List<Object?> get props => [id];
}

final class TakeSearchItemEvent extends CategoryEvent{
  final String name;
  const TakeSearchItemEvent(this.name);
  @override
  List<Object?> get props => [name];
}

final class TakeBookEvent extends CategoryEvent{
  final String url;
 const TakeBookEvent({required this.url});
  @override
  List<Object?> get props => [url];
}
