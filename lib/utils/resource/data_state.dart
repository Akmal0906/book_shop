import 'package:dio/dio.dart';

abstract class DataState<T>{
final T? data;
final DioException? error;
const DataState({this.error,this.data});
}

final class DataSuccess<T> extends DataState<T>{
const DataSuccess(T data):super(data: data);
}
final class DataFailed<T> extends DataState<T>{
  const DataFailed(DioException error):super(error: error);
}

final class DataIsEmpty<T> extends DataState<T>{
  const DataIsEmpty(T string) :super(data:string);
}
final class DataError<T> extends DataState<T>{
  const DataError(T string):super(data: string);
}

