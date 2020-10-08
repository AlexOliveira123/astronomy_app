import 'package:astronomy_app/app/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/astronomy_repository_interface.dart';

part 'astronomy_repository.g.dart';

@Injectable()
class AstronomyRepository implements IAstronomyRepository {
  final Dio client;

  AstronomyRepository(this.client);

  getApodData() async {
    client.options.connectTimeout = 10000;
    try {
      final response = await client.get(
        '$baseUrl/planetary/apod?api_key=$apiKey&count=10',
      );

      return response;
    } on DioError catch (e) {
      print('Error - $e');
      return e.type;
    }
  }

  @override
  void dispose() {}
}
