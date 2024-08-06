import 'package:bi/featurs/details/data/repositories/repo_imp.dart';
import 'package:bi/featurs/homeScreen/data/repositories/home_repo_imp.dart';
import 'package:bi/widgeta/contex.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'bases/developer_settings/cubit/developer_cubit.dart';
import 'common/Theme/theme_bloc/theme_bloc.dart';
import 'featurs/details/data/data_sources/remote_data_source.dart';
import 'featurs/details/domain/repositories/add_rate_repo.dart';
import 'featurs/details/domain/use_cases/add_fav_use_case.dart';
import 'featurs/details/domain/use_cases/add_rate_use_case.dart';
import 'featurs/details/domain/use_cases/delete_rate_use_case.dart';
import 'featurs/details/presentaion/manager/detaills_cubit.dart';
import 'featurs/favorite/domain/use_case/fav_use_case.dart';
import 'featurs/favorite/presentaion/manager/favorite_cubit.dart';
import 'featurs/home/presentaion/manager/home_cubit.dart';
import 'featurs/homeScreen/domain/repositories/home_repo.dart';
import 'featurs/homeScreen/domain/use_cases/use_case.dart';
import 'featurs/homeScreen/presentaion/manager/home_screen_cubit.dart';
import 'featurs/onboarding/controller/cubit/on_boarding_controller_cubit.dart';
import 'featurs/search/data/data_source/remote_data_source.dart';
import 'featurs/search/data/repositories/search_repo_imp.dart';
import 'featurs/search/domain/repositories/search_repo.dart';
import 'featurs/search/domain/use_cases/use_case.dart';
import 'featurs/search/presentaion/manager/search_screen_cubit.dart';
import 'featurs/top/data/data_source/remote_data_source.dart';
import 'featurs/top/data/repo_imp/repo_imp.dart';
import 'featurs/top/domain/repo/top_rated_repo.dart';
import 'featurs/top/domain/use_case/top_rated.dart';
import 'featurs/top/presentaion/manager/top_rated_cubit.dart';
import 'helper/connectivity.dart';
import 'localization/cubit/localization_cubit.dart';
import 'networking/DioClient.dart';
import 'networking/api_service.dart';
import 'networking/network_service.dart';

final sl = GetIt.instance;

final getIt = sl();

Future<void> init() async {
  sl.registerFactory<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<ConnectivityCubit>(
      () => ConnectivityCubit(sl<Connectivity>()));

  sl.registerFactory<OnBoardingControllerCubit>(
      () => OnBoardingControllerCubit());

  sl.registerLazySingleton<DeveloperCubit>(() => DeveloperCubit());
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerSingleton<NetworkService>(NetworkService(sl<DioClient>()));
  sl.registerSingleton<ApiService>(ApiService(sl<NetworkService>()));
  sl.registerLazySingleton<ConText>(() => ConText());
  sl.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  sl.registerLazySingleton<LocalizationCubit>(() => LocalizationCubit());

  sl.registerLazySingleton<FavoriteCubit>(() => FavoriteCubit(getFavoriteUseCase: sl()));
  
  ///cubit
  sl.registerLazySingleton<HomeScreenCubit>(() =>
      HomeScreenCubit(homeScreenUseCase: sl(),


      ));
   sl.registerLazySingleton<HomeCubit>(() =>
       HomeCubit( ));
   sl.registerLazySingleton<DetailsCubit>(() =>
       DetailsCubit(sl(),sl(),sl()));
       sl.registerLazySingleton<SearchScreenCubit>(() =>
           SearchScreenCubit(sl() ));

//TopRatedCubit

  sl.registerLazySingleton<TopRatedCubit>(() =>
      TopRatedCubit( getTopRatedUseCase:  sl(),));
  ///repo


  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImp(apiService: sl()));
  sl.registerLazySingleton<SearchRepo>(() => SearchRepoImp( sl()));
  sl.registerLazySingleton<AddRateRepo>(() => AddRateRepoImp( sl()));
  //TopRatedRepo
  sl.registerLazySingleton<TopRatedRepo>(() => TopRatedRepoImp(  topRatedMoviesRemoteDataSource: sl()));
   
  ///use cases
  sl.registerLazySingleton<HomeScreenUseCase>(() =>
      HomeScreenUseCase(repository: sl() ));

  sl.registerLazySingleton<SearchScreenUseCase>(() =>
      SearchScreenUseCase(repository: sl() ));
  sl.registerLazySingleton<AddRateUseCase>(() =>
      AddRateUseCase(repository: sl() ));

  sl.registerLazySingleton<DeleteFavUseCase>(() =>
      DeleteFavUseCase(repository: sl() ));
  sl.registerLazySingleton<AddFavUseCase>(() =>
      AddFavUseCase(repository: sl() ));

  sl.registerSingleton<GetFavoriteUseCase>(GetFavoriteUseCase(repository: sl()));
  //GetTopRatedUseCase
  sl.registerLazySingleton<GetTopRatedUseCase>(() =>
      GetTopRatedUseCase(repository: sl() ));

/// data source

  sl.registerLazySingleton<AddRateRemoteDataSource>(
          () => AddRateRemoteDataSourceImpl(consumer: sl()));

 sl.registerLazySingleton<TopRatedMoviesRemoteDataSource>(
          () => TopRatedMoviesRemoteDataSourceImpl(consumer: sl()));


  sl.registerLazySingleton<GetSearchedMovieRemoteDataSource>(
          () => GetSearchedMovieRemoteDataSourceImpl(consumer: sl()));


  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => Dio());
}
