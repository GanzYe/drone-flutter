import 'package:dio/dio.dart';
import 'package:drone/data/client/dio_client.dart';
import 'package:drone/models/drone_model.dart';

class DroneSource {
  DroneSource({
    required this.dio,
  });

  final DioClient dio;

  Future<List<DroneModel>> getDrones() async {
    final Response<dynamic> response = await dio.sendRequest.get(
      'airspace',
    );

    final List<DroneModel> drones = (response.data as List<dynamic>)
        .map((item) => DroneModel.fromJson(item as Map<String, dynamic>))
        .toList();

    return drones;
  }
}
