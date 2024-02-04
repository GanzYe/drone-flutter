import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:drone/data/data_sources/drone_data_source.dart';
import 'package:drone/models/drone_model.dart';

class DroneRepository {
  DroneRepository({
    required this.droneSource,
  });

  final DroneSource droneSource;
  Future<Either<int, List<DroneModel>>> getDrones() async {
    try {
      final sportResponse = await droneSource.getDrones();
      return Right(sportResponse);
    } on DioException catch (e) {
      return Left(e.response?.statusCode ?? 404);
    } catch (_) {
      return const Left(404);
    }
  }
}
