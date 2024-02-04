import 'package:dio/dio.dart';
import 'package:drone/data/client/dio_client.dart';
import 'package:drone/models/altitude_model.dart';
import 'package:drone/models/drone_model.dart';
import 'package:drone/models/location_model.dart';

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

  Future<int> sendDrone(
    String uasID,
    LocationModel locationModel,
    AltitudeModel altitudeModel,
    DateTime start,
    DateTime end,
  ) async {
    final Response<dynamic> response = await dio.sendRequest.post(
      'plan',
      data: {
        'uas_id': uasID,
        'location': locationModel.toJson(),
        'altitude': altitudeModel.toJson(),
        'date_start': start.toString(),
        'date_end': end.toString(),
      },
    );
    return response.statusCode ?? 404;
  }
}
