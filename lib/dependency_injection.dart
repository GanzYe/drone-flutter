import 'package:drone/bloc/drones_details_cubit/drones_details_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt
    ..registerLazySingleton<DronesDetailsCubit>(
      DronesDetailsCubit.new,
    );
}
