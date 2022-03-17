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

  // locator.registerLazySingleton<TvRemoteDataSource>(
  //     () => TvRemoteDataSourceImp(locator()));

  // locator.registerLazySingleton<TvLocalDataSource>(
  //     () => TvLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  //http
  locator.registerLazySingleton(() => http.Client());

  //blocs movie
  locator.registerFactory(() => CartBloc(locator()));
  locator.registerFactory(() => ProfileBloc(locator()));

  // locator.registerFactory(() => MoviePopularBloc(locator()));
  // locator.registerFactory(() => MovieTopRatedBloc(locator()));
  // locator.registerFactory(() => MovieDetailBloc(locator()));
  // locator.registerFactory(() => MovieWatchlistBloc(locator()));
  // locator.registerFactory(() => CastDetailBloc(locator()));
  // locator.registerFactory(() => MovieSearchBloc(locator()));

  //blocs tv
  // locator.registerFactory(() => TvNowPlayingBloc(locator()));
  // locator.registerFactory(() => TvPopularBloc(locator()));
  // locator.registerFactory(() => TvTopRatedBloc(locator()));
  // locator.registerFactory(() => TvDetailBloc(locator()));
  // locator.registerFactory(() => TvWatchlistBloc(locator()));
  // locator.registerFactory(() => TvSearchBloc(locator()));
}
