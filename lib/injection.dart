import 'package:get_it/get_it.dart';
import 'package:klikdaily/data/datasource/db/database_helper.dart';
import 'package:klikdaily/data/datasource/fruit_localdata_source.dart';
import 'package:klikdaily/data/datasource/fruit_remotedata_source.dart';
import 'package:klikdaily/data/repositories/fruit_repository_impl.dart';
import 'package:klikdaily/domain/repositories/fruit_repository.dart';
import 'package:http/http.dart' as http;
import 'package:klikdaily/presentation/blocs/cart/cart_bloc.dart';
import 'package:klikdaily/presentation/blocs/profile/profile_bloc.dart';

final locator = GetIt.instance;

void init() {
  // repository
  locator.registerLazySingleton<FruitRepository>(
    () => FruitRepositoryImpl(
        localDataSource: locator(), remoteDataSource: locator()),
  );

  //datasources
  locator.registerLazySingleton<FruitRemoteDataSource>(
      () => FruitRemoteDataSourceImpl(locator()));

  locator.registerLazySingleton<FruitLocalDataSource>(
      () => FruitLocalDataSourceImpl(locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  //http
  locator.registerLazySingleton(() => http.Client());

  //blocs
  locator.registerFactory(() => CartBloc(locator()));
  locator.registerFactory(() => ProfileBloc(locator()));
}
