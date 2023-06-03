import 'package:dio/dio.dart';

procutsgetAPI() async {
  Dio dio = Dio();

  String url = 'https://fakestoreapi.com/products';

  try {
    Response response = await dio.get(
      url,
    );

    return response;
  } on DioError catch (e) {
    return e;
  }
}
