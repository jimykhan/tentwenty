import 'package:flutter/material.dart';
import 'package:tentwenty_task/common_widgets/dot.dart';

class CustomAppBar extends StatefulWidget {
  Color? color;
  Widget? leadingWidget;
  Widget? centreWidget;
  Widget? tralingWidget;
  double? height;
  CustomAppBar({Key? key,this.color,this.centreWidget,this.leadingWidget,this.tralingWidget,this.height}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20,bottom: 15),
      decoration: BoxDecoration(
        color: widget.color?? Colors.white
      ),
      height: widget.height?? 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          widget.leadingWidget??Dot(),
          widget.centreWidget??Dot(),
          widget.tralingWidget??Dot(),
        ],
      ),
    );
  }
}
