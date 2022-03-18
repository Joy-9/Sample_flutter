//配置路由
import 'package:flutter/material.dart';
import '../Widget/AlertDialogDemo/AlertDialogDemo.dart';
import '../Widget/AnimaDemoPage/AnimaDemoPage.dart';
import '../Widget/Bottom/Bottomdemo.dart';
import '../Widget/BottomNavigationWidgetdemo/BottomAppBarDemo.dart';
import '../Widget/BottomNavigationWidgetdemo/BottomNavigationWidget.dart';
import '../Widget/BottomNavigationWidgetdemo/BottomNavigationWidgets.dart';
import '../Widget/CardDemo/CardDemo.dart';
import '../Widget/Datapickerdemo/Datapicker.dart';
import '../Widget/DraggableDemo/DraggableDemo.dart';
import '../Widget/DraggableDemo/DraggableDemo2.dart';
import '../Widget/GestureDetectordemo/GestureDetectordemo.dart';
import '../Widget/Listview/ListViewdemo.dart';
import '../Widget/Listview/PageViewdemo.dart';
import '../Widget/Listview/Pageseffect.dart';
import '../Widget/Listview/SingleChildScrollViewdemo.dart';
import '../Widget/ProviderDemo/ProviderDemo.dart';

import '../Widget/Specialeffect/BottomAnimNavPage/BottomAnimNavPage.dart';
import '../Widget/Specialeffect/ExpansionTileDemo/ExpansionPanelListDemo.dart';
import '../Widget/Specialeffect/ExpansionTileDemo/ExpansionTileDemo.dart';
import '../Widget/Specialeffect/KeepAliveDemo/KeepAliveDemo.dart';
import '../Widget/Specialeffect/Photo/HonorDemoPage.dart';
import '../Widget/Specialeffect/Photo/WarpDemo.dart';
import '../Widget/Specialeffect/besaier/besaier.dart';
import '../Widget/SplashScreendemo/SplashScreen.dart';
import '../Widget/Tabdemo/Tabdemo.dart';
import '../Widget/TableDemo/TableDemo.dart';
import '../Widget/shared_preferences_demo/SQLitedemo.dart';
import '../Widget/shared_preferences_demo/shared_preferences.dart';
import '../mvvmdemo/view/MvvmDemoView.dart';

final Map<String, Function> routes = {
  // '/search': (context, {arguments}) => SearchPage(arguments: arguments), //有参数的
  'ListViewdemo': (context) => ListViewdemo(),//列表
  'SingleChildScrollViewdemo': (context) => SingleChildScrollViewdemo(),
  'PageViewdemo': (context) => PageViewdemo(),//页面
  'Bottomdemo': (context) => Bottomdemo(),//按钮
  'DraggableDemo2': (context) => DraggableDemo2(),
  'DraggableDemo': (context) => DraggableDemo(),//拖拽
  'SplashScreen': (context) => SplashScreen(),//闪屏
  'besaier': (context) => besaier(),
  'ExpansionTileDemo': (context) => ExpansionTileDemo(),
  'ExpansionPanelListDemo': (context) => ExpansionPanelListDemo(),
  'WarpDemo': (context) => WarpDemo(),
  'KeepAliveDemo': (context) => KeepAliveDemo(),
  'FirstPage': (context) => FirstPage(),
  'BottomNavigationWidget': (context) => BottomNavigationWidget(),
  "BottonNavigations": (context) => BottomNavigationWidgets(),
  'BottomAppBarDemo': (context) => BottomAppBarDemo(),
  'AlertDialogDemo': (context) => AlertDialogDemo(),
  'TableDemo': (context) => TableDemo(),
  'CardDemo': (context) => CardDemo(),
  'ProviderDemo': (context) => ProviderDemo(),
  'ProviderDemoTwo': (context) => ProviderDemoTwo(),
  'MvvmDemoView': (context) => MvvmDemoView(),
  'Datapicker': (context) => Datapicker(),
  'Tabdemo': (context) => Tabdemo(),
  'HonorDemoPage': (context) => HonorDemoPage(),
  'AnimaDemoPage': (context) => AnimaDemoPage(),
  'BottomAnimNavPage': (context) => AnimaDemoPage(),
  'GestureDetectordemo': (context) => GestureDetectordemo(),
  'shared_preferences': (context) => shared_preferences(),
  'SQLitedemo': (context) => SQLitedemo(),

};

//固定写法 统一处理
// ignore: prefer_function_declarations_over_variables
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};