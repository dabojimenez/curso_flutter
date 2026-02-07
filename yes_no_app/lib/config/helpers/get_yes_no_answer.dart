import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswere() async {
    final response = await _dio.get('https://yes-no-wtf.vercel.app/api');
    throw UnimplementedError();
  }
}
