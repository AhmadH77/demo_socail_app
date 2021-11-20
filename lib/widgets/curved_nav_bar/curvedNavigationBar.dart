import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curved_navigation_bar/src/nav_button.dart';
import 'package:social_app_demo/constants/theme_color.dart';
import 'package:social_app_demo/util/const.dart';


typedef _LetIndexPage = bool Function(int value);

class CurvedNavigationBar extends StatefulWidget {
  final List<Widget> items;
  final int index;
  final int source;
  final Color color;
  final Color? buttonBackgroundColor;
  final Color backgroundColor;
  final ValueChanged<int>? onTap;
  final _LetIndexPage letIndexChange;
  final Curve animationCurve;
  final Duration animationDuration;
  final double height;

  CurvedNavigationBar({
    Key? key,
    required this.items,
    this.index = 0,
    this.color = Colors.white,
    this.buttonBackgroundColor,
    this.backgroundColor = Colors.blueAccent,
    this.onTap,
    _LetIndexPage? letIndexChange,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    this.height = 75.0, this.source = 1,
  })  : letIndexChange = letIndexChange ?? ((_) => true),
        assert(items.length >= 1),
        assert(0 <= index && index < items.length),
        assert(0 <= height && height <= 75.0),
        super(key: key);

  @override
  CurvedNavigationBarState createState() => CurvedNavigationBarState();
}

class CurvedNavigationBarState extends State<CurvedNavigationBar>
    with SingleTickerProviderStateMixin {
  late double _startingPos;
  int _endingIndex = 0;
  late double _pos;
  double _buttonHide = 0;
  late Widget _icon;
  late AnimationController _animationController;
  late int _length;

  @override
  void initState() {
    super.initState();
    _icon = widget.items[widget.index];
    _length = widget.items.length;
    _pos = widget.index / _length;
    _startingPos = widget.index / _length;
    _animationController = AnimationController(vsync: this, value: _pos);
    _animationController.addListener(() {
      setState(() {
        _pos = _animationController.value;
        final endingPos = _endingIndex / widget.items.length;
        final middle = (endingPos + _startingPos) / 2;
        if ((endingPos - _pos).abs() < (_startingPos - _pos).abs()) {
          _icon = widget.items[_endingIndex];
        }
        _buttonHide =
            (1 - ((middle - _pos) / (_startingPos - middle)).abs()).abs();
      });
    });
  }

  @override
  void didUpdateWidget(CurvedNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      final newPosition = widget.index / _length;
      _startingPos = _pos;
      _endingIndex = widget.index;
      _animationController.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('CurvedNavigationBarState');
    return Container(
      color: Colors.white,//widget.backgroundColor,
      height: widget.height,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // Positioned(
          //   bottom: 20,
          //   left: Directionality.of(context) == TextDirection.rtl
          //       ? null
          //       : _pos * size.width,
          //   right: Directionality.of(context) == TextDirection.rtl
          //       ? _pos * size.width
          //       : null,
          //   width: size.width / _length,
          //   child: Center(
          //     child:Container(
          //       color: widget.buttonBackgroundColor ?? widget.color,
          //       // type: MaterialType.circle,
          //       child:
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child:
          //       _icon,
          //       ),
          //     ),
          //     // Transform.translate(
          //     //   offset: Offset(
          //     //     0,
          //     //     -(1 - _buttonHide) * 80,
          //     //   ),
          //     //   child: Material(
          //     //     color: Colors.red,//widget.buttonBackgroundColor ?? widget.color,
          //     //     // type: MaterialType.circle,
          //     //     child:
          //     //     // Padding(
          //     //     //   padding: const EdgeInsets.all(8.0),
          //     //     //   child:
          //     //       _icon,
          //     //     // ),
          //     //   ),
          //     // ),
          //   ),
          // ),
          Positioned(
              left: widget.index==0 ? -210 : (widget.index == 1 ? 0 : 200),
              right: 0,
              top: 0,
              bottom: 0,//( widget.height),
              child: widget.index == 1
                  ? SvgPicture.asset(
                'assets/icons/middleTab.svg',
                color: widget.source == 1 ? null : (widget.source == 2 ? Constants.shortieHeader1 : ThemeColors.middleCURVE),

              )
                  : (widget.index==0
                    // ? Image.asset('assets/images/leftTab4.png',fit: BoxFit.contain,)
                  ? SvgPicture.asset(
                'assets/icons/leftTab.svg',
                color: widget.source == 1 ? null : (widget.source == 2 ? Constants.shortieHeader1: ThemeColors.middleCURVE),

              )
                    : SvgPicture.asset(
                'assets/icons/rightTab.svg',
                color: widget.source == 1 ? null : (widget.source == 2 ? Constants.shortieHeader3: ThemeColors.topCurve),

              ))
            // CustomPaint(
            //   painter: NavCustomPainter(
            //       _pos, _length, widget.color, Directionality.of(context),_endingIndex),
            //   child: Container(
            //     // color: Colors.red,
            //     height:  widget.height,
            //   ),
            // ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (75.0 - widget.height),
            child: SizedBox(

                height: 100.0,
                child: Row(
                    children: widget.items.map((item) {
                      return NavButton(
                        onTap: _buttonTap,
                        position: _pos,
                        length: _length,
                        index: widget.items.indexOf(item),
                        child: Container(
                          // color: Colors.red,
                            child: Center(child: item)),
                      );
                    }).toList())),
          ),
        ],
      ),
    );
  }

  void setPage(int index) {
    _buttonTap(index);
  }

  void _buttonTap(int index) {
    if (!widget.letIndexChange(index)) {
      return;
    }
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
    final newPosition = index / _length;
    setState(() {

      _startingPos = _pos;
      _endingIndex = index;
      print('new 4 Pos $newPosition ,, $_pos ,, $index');
      try{
        _animationController.animateTo(newPosition,
            duration: widget.animationDuration, curve: widget.animationCurve);
      }catch(e){
        print('errorr  $e');
      }
    });
  }
}
