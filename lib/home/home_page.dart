import 'package:flutter/material.dart';
import 'package:nlw_app/widgets/appbar/app_bar.dart';
import 'package:nlw_app/widgets/levelbutton/level_button_widget.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: LevelButtonWidget("Fácil"),

    );
  }
}
