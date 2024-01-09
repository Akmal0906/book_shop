import 'package:book_shop/data/datasource/local/local_database.dart';
import 'package:book_shop/domain/models/textfield_models/sign_user_model.dart';
import 'package:book_shop/utils/constanst/all_bases_url.dart';
import 'package:book_shop/utils/resource/data_state.dart';
import 'package:dio/dio.dart';
import '../../domain/models/categories_item/categories_item_model.dart';

abstract class FetchAllData {}

class FetchData {
  static const String categoriesUrl =
      'https://iambookish.pythonanywhere.com/book/category/all/';
  static const String categoriesData =
      'https://iambookish.pythonanywhere.com/book/categorybook/';
  static const String firstlyTabUrl =
      'https://iambookish.pythonanywhere.com/book/lastbooks/';

  static const String searchUrl =
      'https://iambookish.pythonanywhere.com/book/search/';
  static const String signUpUrl =
      'https://iambookish.pythonanywhere.com/api/v1/dj-rest-auth/registration/';
  static const String tokenUrl = '/book/token/';
  final dio = Dio();

  Future<DataState> fetchItemModel({int id = 0}) async {
    List<CateItemModel> res = [];
    try {
      final response =
          await dio.get(id == 0 ? firstlyTabUrl : '$categoriesData$id/');

      if (response.statusCode == 200) {
        final List jsonResponse;

        id == 0
            ? jsonResponse = response.data['data']
            : jsonResponse = response.data;
        res = jsonResponse.map((e) => CateItemModel.fromJson(e)).toList();
        return DataSuccess(res);
      } else {

        throw DioException(
            requestOptions: response.requestOptions, response: response);
      }
    } on DioException catch (e) {

      return DataFailed(e);
    }
  }

  Future<DataState> fetchSearchItem(String str) async {
    List<CateItemModel> res = [];

    final queryPrams = {'title': str};
    try {
      final response = await dio.get(searchUrl, queryParameters: queryPrams);

      if (response.statusCode == 200) {
        if (response.data.isNotEmpty) {
          final List jsonResponse = response.data;
          res = jsonResponse.map((e) => CateItemModel.fromJson(e)).toList();
          return DataSuccess(res);
        } else {
          return const DataIsEmpty('Data did not found');
        }
      } else {
        throw DioException(
            requestOptions: response.requestOptions, response: response);
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  Future<DataState> signUpMethod(SignUserModel model) async {
    try {
      final response = await dio.post(signUpUrl, data: model.toJson());
      if (response.statusCode == 200 || response.statusCode == 204) {
        return DataSuccess(model);
      } else if (response.statusCode == 400) {
        return DataError(SignUserModel.fromJson(response.data));
      } else {
        throw DioException(
            requestOptions: response.requestOptions, response: response);
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  Future<DataState> getToken(SignUserModel model) async {
    try {
      final response = await dio
          .post(AllBasesUrl.baseUrl + tokenUrl, data: {'username': model.username});
      if (response.statusCode==201||response.statusCode==200) {
        await LocalDatabase().addDataLocally(model.copyWith(token: response.data['access']));

        return DataSuccess(response.data['access']);
      } else if (response.statusCode == 404) {
        return DataError(response.data);
      } else {
        throw DioException(
            requestOptions: response.requestOptions, response: response);
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }


}
