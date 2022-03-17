import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/routes/Routes.dart';

import 'MyHomePage.dart';
import 'Widget/AlertDialogDemo/AlertDialogDemo.dart';
import 'Widget/Bottom/Bottomdemo.dart';
import 'Widget/BottomNavigationWidgetdemo/BottomAppBarDemo.dart';
import 'Widget/BottomNavigationWidgetdemo/BottomNavigationWidget.dart';
import 'Widget/BottomNavigationWidgetdemo/BottomNavigationWidgets.dart';
import 'Widget/CardDemo/CardDemo.dart';
import 'Widget/Datapickerdemo/Datapicker.dart';
import 'Widget/DraggableDemo/DraggableDemo.dart';
import 'Widget/DraggableDemo/DraggableDemo2.dart';
import 'Widget/Listview/ListViewdemo.dart';
import 'Widget/Listview/PageViewdemo.dart';
import 'Widget/Listview/Pageseffect.dart';
import 'Widget/Listview/SingleChildScrollViewdemo.dart';
import 'Widget/ProviderDemo/CountProvider.dart';
import 'Widget/ProviderDemo/ProviderDemo.dart';
import 'Widget/SearchBarDemo/SearchBarDemo.dart';
import 'Widget/Specialeffect/ExpansionTileDemo/ExpansionPanelListDemo.dart';
import 'Widget/Specialeffect/ExpansionTileDemo/ExpansionTileDemo.dart';
import 'Widget/Specialeffect/KeepAliveDemo/KeepAliveDemo.dart';
import 'Widget/Specialeffect/Photo/WarpDemo.dart';
import 'Widget/Specialeffect/besaier/besaier.dart';
import 'Widget/SplashScreendemo/SplashScreen.dart';
import 'Widget/Tabdemo/Tabdemo.dart';
import 'Widget/TableDemo/TableDemo.dart';
import 'mvvmdemo/view/MvvmDemoView.dart';
import 'mvvmdemo/viewmodel/MvvmDemoViewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MvvmDemoViewmodel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  GlobalKey _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        key: _formKey,
      debugShowCheckedModeBanner: false,//去掉debug图标
      title: 'Flutter Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'SplashScreen',//初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute//路由的设置
    );
  }
}
