import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SearchIcon extends StatelessWidget {
   Function() onClick;
  SearchIcon({Key? key,required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        child: SvgPicture.asset("assets/icons/search.svg",width: 17,height: 20,),
      ),
    );
  }
}
