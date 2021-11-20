import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/src/provider.dart';
import 'package:social_app_demo/provider/create_dialog.dart';

class CardButton extends StatelessWidget{
  final color;
  final icon;

  CardButton({required this.color,required this.icon});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () => context.read<CreateDialogProvider>().change(1),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: color,
        child:  Container(
          padding: EdgeInsets.all(20),
          child: SvgPicture.asset(
            icon,//'assets/svg/Fire.svg',
          ),
        ),
      ),
    );
  }


}