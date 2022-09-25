import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tentwenty_task/models/upcoming_movies_model.dart';
import 'package:tentwenty_task/providers/providers.dart';
import 'package:tentwenty_task/services/move_service/move_service.dart';

class UpComingMoviesViewModel extends ChangeNotifier{
  ProviderReference? _ref;
  UpComingMoviesModel? upComingMoviesModel;
  MoveService? moveService;
  bool loading = false;
  UpComingMoviesViewModel({ProviderReference? ref}){
    _ref = ref;
    moveService = _ref?.read(moveServicesProvider);
  }

  setLoading(flag){
    loading = flag;
    notifyListeners();
  }

  getUpComingMovies()async{
    setLoading(true);
    upComingMoviesModel = await moveService?.getUpcomingMovies()?? null;
    setLoading(false);
  }
}
