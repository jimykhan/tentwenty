import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tentwenty_task/common_widgets/custom_appbar.dart';
import 'package:tentwenty_task/common_widgets/custom_bottom_bar.dart';
import 'package:tentwenty_task/common_widgets/custom_loader.dart';
import 'package:tentwenty_task/common_widgets/header_text.dart';
import 'package:tentwenty_task/common_widgets/search_icon.dart';
import 'package:tentwenty_task/main.dart';
import 'package:tentwenty_task/providers/providers.dart';
import 'package:tentwenty_task/utils/application_sizing.dart';
import 'package:tentwenty_task/view_view_model/upcoming_movies/components/poster.dart';
import 'package:tentwenty_task/view_view_model/upcoming_movies/upcoming_movies_view_model.dart';
class UpComingMoviesView extends HookWidget {
  UpComingMoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UpComingMoviesViewModel upComingMoviesViewModel = useProvider(upComingMoviesViewModelProvider);
    useEffect(
          () {
          ApplicationSizing(applicationContext!.currentContext!);
        Future.microtask(() async {
            upComingMoviesViewModel.getUpComingMovies();
        });
        return () {
          // Dispose Objects here
        };
      },
      const [],
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ApplicationSizing.convert(90)),
        child: CustomAppBar(
          leadingWidget: HeaderTextStyle(text: "Watch",),
          tralingWidget: SearchIcon(onClick: () {  },),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomBar(selectedIndex: 2,),
      body: upComingMoviesViewModel.loading ? CustomLoader() :
      Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              ListView.separated(
                padding: EdgeInsets.zero,

                shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Poster(
                          imageUrl: upComingMoviesViewModel.upComingMoviesModel!.results![index].posterPath!,
                          name: upComingMoviesViewModel.upComingMoviesModel!.results![index].title!,
                        ));
                  },
                  separatorBuilder: (context,index){
                    return SizedBox(height: 10,);
                  },
                  itemCount: upComingMoviesViewModel.upComingMoviesModel?.results?.length??0),
              SizedBox(height: 70,),
            ],
          ),
        ),
      ),
    );
  }
}