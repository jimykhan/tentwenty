import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tentwenty_task/services/dio_services/dio_services.dart';
import 'package:tentwenty_task/services/move_service/move_service.dart';
import 'package:tentwenty_task/view_view_model/upcoming_movies/upcoming_movies_view_model.dart';

final dioServicesProvider = Provider<DioServices>((ref)=>DioServices(ref: ref));
final moveServicesProvider = Provider<MoveService>((ref)=>MoveService(ref: ref));



final upComingMoviesViewModelProvider = ChangeNotifierProvider<UpComingMoviesViewModel>((ref)=>UpComingMoviesViewModel(ref: ref));


