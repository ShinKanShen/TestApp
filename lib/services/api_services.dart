import 'package:dio/dio.dart';
import 'package:thuc_tap/model/chung_khoan_model.dart';

class AppApiService {
  final Dio _dio = Dio();
  final _baseUrl = 'http://103.219.180.159/datafeed/';

  Future<ChungKhoan?> getChungKhoan(String? marketcode) async {
    ChungKhoan? chungkhoans;
    try {
      Response chungKhoanData =
          await _dio.get('$_baseUrl/instruments/$marketcode');
      print('chungkhoan data: ${chungKhoanData.statusCode}');

      chungkhoans = ChungKhoan.fromJson(chungKhoanData.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return chungkhoans;
  }
}
