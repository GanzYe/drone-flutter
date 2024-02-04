import 'package:drone/bloc/drones_details_cubit/drones_details_cubit.dart';
import 'package:drone/data/client/dio_client.dart';
import 'package:drone/data/data_sources/drone_data_source.dart';
import 'package:drone/data/repositories/drone_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt
    ..registerLazySingleton<DronesDetailsCubit>(
      DronesDetailsCubit.new,
    )
    ..registerLazySingleton<DroneRepository>(
      () => DroneRepository(droneSource: getIt<DroneSource>()),
    )
    ..registerLazySingleton<DroneSource>(
      () => DroneSource(dio: getIt<DioClient>()),
    )
    ..registerLazySingleton<DioClient>(
      DioClient.new,
    );
}
