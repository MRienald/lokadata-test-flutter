import 'package:dio/dio.dart';
import 'package:message_board_mobile/data/local/secure/secure_storage_manager.dart';
import 'package:message_board_mobile/data/local/storage/storage_constants.dart';
import 'package:message_board_mobile/data/local/storage/storage_manager.dart';
import 'package:message_board_mobile/data/remote/environment.dart';
import 'package:message_board_mobile/data/remote/interceptor/dio.dart';
import 'package:message_board_mobile/data/remote/wrapper/api_response.dart';
import 'package:message_board_mobile/model/message.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static Future<RestClient> create({
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    final _headers = Map<String, dynamic>.from(headers);
    final token = await SecureStorageManager().getToken() ?? "";
    final language =
        await StorageManager().get(StorageName.CURRENT_LOCALE) ?? "id";

    if (!_headers.containsKey("Authorization") && token.isNotEmpty) {
      _headers["Authorization"] = 'Bearer $token';
    }
    _headers["Accept"] = "application/json";
    if (!_headers.containsKey('Content-Type')) {
      _headers["Content-Type"] = 'application/json';
      _headers["Locale"] = language;
    }

    return RestClient(
      await AppDio().getDIO(
        headers: _headers,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
      ),
      baseUrl: ConfigEnvironments.getEnvironments().toString(),
    );
  }

  @GET("/api/message")
  Future<ResponseList<Message>> getAllMessage();
      
}

const client = RestClient.create;