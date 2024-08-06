




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/AppColors.dart';
import '../../../../../core/util/app_consts.dart';
import '../../../../../generated/assets.dart';
import '../../../../../widgeta/custom_card.dart';
import '../../../../homeScreen/data/models/add_profile_model.dart';

class SearchListWidget<T> extends StatelessWidget {
  List<T> listOfSearchedPlaces;
  void Function(T selected)? onTap;
  TextEditingController inputTextField;
  final bool loading;
  SearchListWidget(
      {super.key,
        required this.listOfSearchedPlaces,
        required this.onTap,
        required this.loading,
        required this.inputTextField
      });
  @override
  Widget build(BuildContext context) {
    return ((listOfSearchedPlaces.isEmpty&& !loading) ||  inputTextField.text.isEmpty)?const SizedBox(
      child: Text('No results found'),
    ): Container(
      height:loading?50.h: MediaQuery.of(context).size.height,
      width:loading?200.w: 400.w,
      decoration:K.whiteBoxDecoration(contextt: context),
      padding: EdgeInsets.only(top: 10.h),
      child:Container(
        height: 200,
        // color: Colors.red,

      child:loading &&inputTextField.text.isNotEmpty? const Center(
        child: Text('loading...'
        ),
      ):

      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount:listOfSearchedPlaces.length,
        itemBuilder: (context, index) {
          var item = listOfSearchedPlaces[index];
          var title;
          var description;
          // if(item is Predictions){
          //     title = item
          //       .structuredFormatting?.mainText
          //       .toString() ??
          //       item
          //           .structuredFormatting
          //           ?.secondaryText
          //           .toString() ??'';
          //     description=item.description??'';
          // }
          // else
            if(item is Movie){
              title = item.title.toString() ??'';
              description=item.originalTitle.toString() ??'';

          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // print(item.structuredFormatting?.secondaryText);
                },
                // onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                      visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                      leading: CustomCard(
                        width: 100.w,
                        image: (item as Movie).posterUrl,
                      ),
                      title: Text(
                      title,
                        style: TextStyle(fontSize: 12.sp),
                        maxLines: 1,
                      ),
                      subtitle: Text( description ,
                        style: TextStyle(
                            color: AppColors.grey, fontSize: 10.sp),
                      ),
                      trailing:Image.asset( Assets.iconsUpArrow,width: 15.w,height: 30.h,),

                      onTap: () async {
                        // print(listOfSearchedPlaces[index].description);
                        onTap?.call(item);
                      }),
                ),
              ),
              index == listOfSearchedPlaces.length - 1
                  ? const SizedBox()
                  :

              Padding(
                padding:   EdgeInsets.only(left: 10.0.w,right: 10.w),
                child:   Divider(
                  color: AppColors.grey.withOpacity(.5),
                  thickness: 1,
                ),
              ),
            ],
          );
        },
      ),
      ),
    );
  }
}
