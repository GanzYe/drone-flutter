import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:drone/data/data_sources/drone_data_source.dart';
import 'package:drone/models/altitude_model.dart';
import 'package:drone/models/drone_model.dart';
import 'package:drone/models/error_model.dart';
import 'package:drone/models/location_model.dart';

class DroneRepository {
  DroneRepository({
    required this.droneSource,
  });

  final DroneSource droneSource;
  Future<Either<ErrorModel, List<DroneModel>>> getDrones() async {
    try {
      final sportResponse = await droneSource.getDrones();
      return Right(sportResponse);
    } on DioException catch (e) {
      if (e.response == null) {
        return const Left(
          ErrorModel(
            errorCode: '404',
            errorMessage: 'Lost internet connection',
          ),
        );
      }
      return Left(
          ErrorModel.fromJson(e.response!.data as Map<String, dynamic>));
    } catch (_) {
      return const Left(
        ErrorModel(errorCode: '404', errorMessage: 'Not found'),
      );
    }
  }

  Future<Either<ErrorModel, int>> sendDrone(
    String uasID,
    LocationModel locationModel,
    AltitudeModel altitudeModel,
    DateTime start,
    DateTime end,
  ) async {
    try {
      final sportResponse = await droneSource.sendDrone(
        uasID,
        locationModel,
        altitudeModel,
        start,
        end,
      );
      return Right(sportResponse);
    } on DioException catch (e) {
      if (e.response == null) {
        return const Left(
          ErrorModel(
            errorCode: '404',
            errorMessage: 'Lost internet connection',
          ),
        );
      }
      return Left(
        ErrorModel.fromJson(e.response!.data as Map<String, dynamic>),
      );
    } catch (_) {
      return const Left(
        ErrorModel(errorCode: '404', errorMessage: 'Not found'),
      );
    }
  }
}
