import 'package:dio/dio.dart';

class DBService {
  Future<bool> increment(int counter) async {
    try {
      var dio = Dio();
      var res = await dio.get(
        'https://tickyar.ir/api/v1/site/increment',
      );
      if (res.statusCode == 200) {
        return true;
      }
    } catch (e) {
      throw Exception('server error');
    }
    throw Exception('unknown error');
  }

  Future<bool> decrement(int counter) async {
    try {
      var dio = Dio();
      var res = await dio.get(
        'https://tickyar.ir/api/v1/site/decrement',
      );
      if (res.statusCode == 200) {
        return true;
      }
    } catch (e) {
      throw Exception('server error');
    }
    throw Exception('unknown error');
  }

  Future<int> readCounter() async {
    try {
      var dio = Dio();
      var res = await dio.get(
        'https://tickyar.ir/api/v1/site/read',
      );
      if (res.statusCode == 200) {
        return res.data;
      }
    } catch (e) {
      throw Exception('server error');
    }
    throw Exception('unknown error');
  }
}
