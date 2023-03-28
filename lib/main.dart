import 'package:flutter/material.dart';
import 'package:ui_flutter/landingpage/util/constant.dart';
import 'package:ui_flutter/screens/OtpScreen.dart';
import 'package:ui_flutter/screens/WhatsAppProfileScreen.dart';
import 'package:ui_flutter/rippleanimation/RipplesAnimation.dart';
import 'package:ui_flutter/animatedContainer/AnimatedContainerClass.dart';
import 'package:ui_flutter/slidemenuanimation/slide_menu_animation.dart';
import 'package:ui_flutter/splash/splash.dart';
import 'package:ui_flutter/stack/stack.dart';

import 'airbnb/pages/airbnb_homr_page.dart';
import 'animation/animation_class.dart';
import 'bottomsheetanimation/bottom_sheet.dart';
import 'coinbase/pages/coinbase_homepage.dart';
import 'counterdisplay/counter_display.dart';
import 'disneyui/disney_home_page.dart';
import 'donwloadbutton/download_botton.dart';
import 'form/form_validate.dart';
import 'landing_page_music.dart';
import 'landingpage/landing_page.dart';
import 'shoppinglist/shoppping_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Flutter UI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home:  const BottomSheetWidget(),
    );
  }
}
