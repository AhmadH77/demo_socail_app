import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app_demo/provider/create_dialog.dart';
import 'package:social_app_demo/screens/create_dialog_screens/choose_type.dart';
import 'package:provider/provider.dart';
import 'package:social_app_demo/screens/create_dialog_screens/set_details.dart';

class NewContentDialog {
  List pages = [ChooseType(), SetDetails()];

  void show(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return WillPopScope(
            onWillPop: ()async{return false;},
            child: StatefulBuilder(builder: (context, setState) {
              var index = context.watch<CreateDialogProvider>().index;
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    context.watch<CreateDialogProvider>().index == 0
                        ? Center(
                            child: SvgPicture.asset('assets/svg/Line_1.svg'),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: ()=> context.read<CreateDialogProvider>().change(index - 1),
                                  icon: SvgPicture.asset('assets/svg/CaretLeft.svg')),
                              InkWell(
                                onTap: () {
                                  context.read<CreateDialogProvider>().change(0);
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                    children: [
                                      Text('Done',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, fontFamily: 'regular'),),
                                      SvgPicture.asset(
                                          'assets/svg/CaretRight.svg')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 25.0),
                        child: pages[context.watch<CreateDialogProvider>().index])
                  ],
                ),
              );
            }),
          );
        });
  }
}
