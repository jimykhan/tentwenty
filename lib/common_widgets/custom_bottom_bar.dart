import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tentwenty_task/utils/application_sizing.dart';
import 'package:tentwenty_task/utils/color.dart';

class BottomBar extends HookWidget {
  int selectedIndex;
  BottomBar({Key? key, required this.selectedIndex}) : super(key: key);
  Color selectedColor = Colors.white;
  Color unSelectedColor = Colors.white.withOpacity(0.54);
  @override
  Widget build(BuildContext context) {

    useEffect(
          () {
        Future.microtask(() async {});
        return () {
          // Dispose Objects here
        };
      },
      const [],
    );
    return  BottomAppBar(
      /// Customize Bottom app bar in plugin code remove safe
      color: Colors.transparent,
      // shape: const CircularNotchedRectangle(),
      // notchMargin: 9.0,
      // elevation: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
          ),
          color: bottomColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),

        height: ApplicationSizing.convert(60),
        // color: Colors.black,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  if (selectedIndex != 1) {
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SvgPicture.asset(
                      "assets/icons/dashboard.svg",
                      height: ApplicationSizing.convert(17),
                      color: selectedIndex == 1 ? selectedColor : unSelectedColor,
                    ),
                    SizedBox(height: 3,),
                    Text("Dashboard",style: TextStyle(
                      fontSize: 10,
                        color: selectedIndex == 1 ? selectedColor : unSelectedColor,
                      fontWeight: FontWeight.w400
                    ),)
                  ],
                ),
              ),
            ),
            // ApplicationSizing.horizontalSpacer(n: 180),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () async {
                  if (selectedIndex != 2) {

                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SvgPicture.asset(
                      "assets/icons/watch.svg",
                      height: ApplicationSizing.convert(17),
                      color: selectedIndex == 2 ? selectedColor : unSelectedColor,
                    ),
                    SizedBox(height: 3,),
                    Text("Watch",style: TextStyle(
                        fontSize: 10,
                        color: selectedIndex == 2 ? selectedColor : unSelectedColor,
                        fontWeight: FontWeight.w400
                    ),)
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () async {
                  if (selectedIndex != 3) {

                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SvgPicture.asset(
                      "assets/icons/media.svg",
                      height: ApplicationSizing.convert(17),
                      color: selectedIndex == 3 ? selectedColor : unSelectedColor,
                    ),
                    SizedBox(height: 3,),
                    Text("Media Library",style: TextStyle(
                        fontSize: 10,
                        color: selectedIndex == 3 ? selectedColor : unSelectedColor,
                        fontWeight: FontWeight.w400
                    ),)
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () async {
                  if (selectedIndex != 4) {

                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SvgPicture.asset(
                      "assets/icons/media.svg",
                      height: ApplicationSizing.convert(17),
                      color: selectedIndex == 4 ? selectedColor : unSelectedColor,
                    ),
                    SizedBox(height: 3,),
                    Text("More",style: TextStyle(
                        fontSize: 10,
                        color: selectedIndex == 4 ? selectedColor : unSelectedColor,
                        fontWeight: FontWeight.w400
                    ),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}