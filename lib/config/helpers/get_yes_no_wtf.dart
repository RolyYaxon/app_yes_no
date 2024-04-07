import 'package:app_yes_no/domain/entities/message.dart';
import 'package:app_yes_no/infrastructure/models/model.dart';
import 'package:dio/dio.dart';

class GetYesNo {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");

    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    return yesNoModel.toMessageEntity();
    
  }
}
