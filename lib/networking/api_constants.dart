import 'package:flutter_dotenv/flutter_dotenv.dart';

enum ENVIRONMENT {
  DEV,
  QC,
  PROD,
  MOCKUP,
}

class APiConstants {
  static var environment = ENVIRONMENT.DEV;

  static const BASE_DEV_URL =
      "https://api.themoviedb.org/3/";
  static const BASE_DEV_URL_With_User =
      "https://api.themoviedb.org/3/";
  static const BASE_QC_URL = "";
  // static const String apiKey='3062138b73f3537d2f7dad556ee542e5';

  static  String get sessionId =>dotenv.get("session_id");

  static    get STATIC_ACC_ID => dotenv.get("acc_id");
  static String get apiKey => dotenv.get("api_key");



  static const BASE_PROD_URL = "";

  static String get getENVUrl {
    var url = BASE_DEV_URL;
    if (environment == ENVIRONMENT.DEV) {
      url = BASE_DEV_URL_With_User;
    } else if (environment == ENVIRONMENT.QC) {
      url = BASE_QC_URL;
    } else if (environment == ENVIRONMENT.PROD) {
      url = BASE_PROD_URL;
    } else if (environment == ENVIRONMENT.MOCKUP) {
      APiConstants.enableMockUp = true;
    }

    return url;
  }

  static const defaultSubStatus = 0;

  static bool enableMockUp = false;

  static const String getMovies = "discover/movie";

  static const String getTv = "discover/tv";
  static const String getOneSearch = "search/movie";
  static const String getTopRated = "movie/top_rated";
  static const String addRating = "movie/{movie_id}/rating";
  static   String addFav = "account/$STATIC_ACC_ID/favorite";



}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
