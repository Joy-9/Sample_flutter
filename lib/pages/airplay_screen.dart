import 'package:flutter/material.dart';

import '../Widget/SearchBarDemo/SearchBarDemo.dart';

class AirplayScreen extends StatefulWidget {
  const AirplayScreen({Key? key}) : super(key: key);

  @override
  State<AirplayScreen> createState() => _AirplayScreenState();
}
class SliverAppBarDemo extends StatelessWidget {
  List<String>list=["ListViewdemo","SingleChildScrollViewdemo","PageViewdemo","Bottomdemo","DraggableDemo","besaier",
    "ExpansionTileDemo","WarpDemo","KeepAliveDemo","BottomNavigationWidget","AlertDialogDemo","TableDemo","CardDemo",
    "ProviderDemo","MvvmDemoView","Datapicker","Tabdemo","HonorDemoPage","AnimaDemoPage","ViewPagerDemoPage",
  "BottomAnimNavPage"];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[

        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(

                (BuildContext context, int index) {
              return Card(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.primaries[(index % 18)],
                  child: _ListItem(title: list[index], shu: index,),
                ),
              );

            },
            childCount: 21
          ),
        ),
      ],
    );
  }
}

class _AirplayScreenState extends State<AirplayScreen> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('组件案例',style: TextStyle(color: Colors.black),), centerTitle:true,backgroundColor:Colors.white,actions: <Widget>[
      IconButton(
        color: Colors.black,
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: searchBarDelegate());
          }
        // showSearch(context:context,delegate: searchBarDelegate()),
      ),
    ]),
        body: SliverAppBarDemo());
  }


@override
  // TODO: implement wantKeepAlive
  // bool get wantKeepAlive => throw UnimplementedError();
  bool get wantKeepAlive => true;
}
class _ListItem extends StatelessWidget {
  final String title;
  final int shu;

  const _ListItem({Key? key, required this.title, required this.shu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(color: Colors.primaries[(shu % 18)],child: Text(title),onPressed: (){

          switch(shu){
            case 0:
              Navigator.of(context).pushNamed("ListViewdemo");
              break;
            case 1:
              Navigator.of(context).pushNamed( "SingleChildScrollViewdemo");
              break;
            case 2:
              Navigator.of(context).pushNamed( "PageViewdemo");
              break;
            case 3:
              Navigator.of(context).pushNamed( "Bottomdemo");
              break;
            case 4:
              Navigator.of(context).pushNamed( "DraggableDemo");
              break;
            case 5:
              Navigator.of(context).pushNamed( "besaier");
              break;
            case 6:
              Navigator.of(context).pushNamed( "ExpansionTileDemo");
              break;
            case 7:
              Navigator.of(context).pushNamed( "WarpDemo");
              break;
            case 8:
              Navigator.of(context).pushNamed( "KeepAliveDemo");
              break;
            case 9:
              Navigator.of(context).pushNamed( "BottomNavigationWidget");
              break;
            case 10:
              Navigator.of(context).pushNamed( "AlertDialogDemo");
              break;
            case 11:
              Navigator.of(context).pushNamed( "TableDemo");
              break;
            case 12:
              Navigator.of(context).pushNamed( "CardDemo");
              break;
            case 13:
              Navigator.of(context).pushNamed( "ProviderDemo");
              break;
            case 14:
              // Navigator.of(context).pushNamed( "MvvmDemoView");
              break;
            case 15:
              // Navigator.of(context).pushNamed( "Datapicker");
              break;
            case 16:
              Navigator.of(context).pushNamed( "Tabdemo");
              break;
            case 17:
              Navigator.of(context).pushNamed( "HonorDemoPage");
              break;
            case 18:
              Navigator.of(context).pushNamed( "AnimaDemoPage");
              break;
            case 19:
              Navigator.of(context).pushNamed( "ViewPagerDemoPage");
              break;
            case 20:
              Navigator.of(context).pushNamed( "ViewPagerDemoPage");
              break;
          }
        }

    );
  }
}


