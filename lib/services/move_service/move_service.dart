import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tentwenty_task/constants/api_strings.dart';
import 'package:tentwenty_task/models/upcoming_movies_model.dart';
import 'package:tentwenty_task/providers/providers.dart';
import 'package:tentwenty_task/services/dio_services/dio_services.dart';
import 'package:tentwenty_task/view_view_model/upcoming_movies/upcoming_movies_view_model.dart';

class MoveService{
  ProviderReference? _ref;
  DioServices? _dioServices;
  MoveService({ProviderReference? ref}){
    _ref = ref;
    _dioServices = _ref?.read(dioServicesProvider);
  }

  Future<UpComingMoviesModel?> getUpcomingMovies()async{
    UpComingMoviesModel? upComingMoviesModel ;
    try{
      Response? response = await _dioServices?.dio?.get("${MovieController.upcoming_movies}?$api_key");
      if(response?.statusCode == 200){
        upComingMoviesModel = UpComingMoviesModel.fromJson(response!.data);
      }
      return upComingMoviesModel;
    }catch(ex){
      print("$ex");
      return null;
    }

  }

  // ignore: non_constant_identifier_names
  getMovieDetailById(int Id){
    _dioServices?.dio?.get("${MovieController.movie_details}/$Id?$api_key");
  }
  // ignore: non_constant_identifier_names
  getMovieImagesById(int Id){
    _dioServices?.dio?.get("${MovieController.movie_details}/$Id/images?$api_key");
  }
}