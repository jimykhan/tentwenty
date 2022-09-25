import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tentwenty_task/constants/api_strings.dart';
class Poster extends StatelessWidget {
   String imageUrl;
   String? name;
  Poster({Key? key,required this.imageUrl,this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.red
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
           Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: image_base_path+imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) {
                            return const Center(
                              child: CircularProgressIndicator
                                  .adaptive(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 70,
                    decoration:  BoxDecoration(
                        // color: Colors.black,
                          gradient: LinearGradient(
                            colors: [Colors.transparent,Colors.black.withOpacity(0.55)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                      borderRadius: BorderRadius.circular(10)
                      ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(name??"No name",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
          ),
                ),
              ],
            )

        ],
      ),
    );
  }
}
