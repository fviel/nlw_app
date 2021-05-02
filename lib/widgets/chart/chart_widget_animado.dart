import 'package:flutter/material.dart';
import 'package:nlw_app/core/app_colors.dart';
import 'package:nlw_app/core/app_text_styles.dart';
import 'dart:core';
import 'package:nlw_app/core/core.dart';


class ChartWidgetAnimado extends StatefulWidget {
  final double value;
  ChartWidgetAnimado({@required this.value});

  @override
  _ChartWidgetAnimadoState createState() => _ChartWidgetAnimadoState();
}


//preciso usar o SingleTickerProviderStateMixin para ter acesso ao vsync
class _ChartWidgetAnimadoState extends State<ChartWidgetAnimado> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _animation;

  void initAnimation(){
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1)
    );
    _animation = Tween<double>(
        begin: 0,
        end: widget.value,
    ).animate(_controller); //as Animation<double>
    _controller.forward();// podia ser o reverse
  }


  @override
  void initState() {
    super.initState();
    initAnimation();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      ///O componente de stack permite empilhar widgets, um em cima do outro
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) => Stack(
          children: [
            Center(
              child: Container(
                height: 80,
                width: 80,
                child:CircularProgressIndicator(
                  strokeWidth: 10,
                  value:_animation.value/100,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
            ),
            Center(
              //child: Text("${(_animation.value * 100).toStringAsPrecision(0)} %",
              child: Text("${(_animation.value).toInt()}%",
                  style: AppTextStyles.heading),
            ),
          ],
        ),
      ),
    );
  }
}


///Stack(
//         children: [
//           Center(
//             child: Container(
//               height: 80,
//               width: 80,
//               child:CircularProgressIndicator(
//                 strokeWidth: 10,
//                 value:.75,
//                 backgroundColor: AppColors.chartSecondary,
//                 valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
//               ),
//             ),
//           ),
//           Center(
//             child: Text("75%",
//             style: AppTextStyles.heading),
//           ),
//         ],
//       ),
