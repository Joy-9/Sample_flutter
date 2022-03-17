import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewdemo extends StatefulWidget {
  const ListViewdemo({Key? key}) : super(key: key);

  @override
  State<ListViewdemo> createState() => _ListViewdemoState();
}

class _ListViewdemoState extends State<ListViewdemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("listview and gridview"),),
      body: mylistview(),
    );
  }
}
class mylistview extends StatefulWidget {
  const mylistview({Key? key}) : super(key: key);

  @override
  State<mylistview> createState() => _mylistviewState();
}

class _mylistviewState extends State<mylistview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: [
    Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),child:_createGridViewItem(Colors.primaries[0],0),),
    Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child:_createGridViewItem(Colors.primaries[1],1),),
    Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child:_createGridViewItem(Colors.primaries[2],2),),
    Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child:_createGridViewItem(Colors.primaries[3],3),),
    Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child:_createGridViewItem(Colors.primaries[4],4),),
    Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child:_createGridViewItem(Colors.primaries[5],5),),
    Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child:_createGridViewItem(Colors.primaries[6],6),),
    Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child:_createGridViewItem(Colors.primaries[7],7),),
    Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child:_createGridViewItem(Colors.primaries[8],8),),
      ],
      physics:const BouncingScrollPhysics() ,
    );
  }
}
_createGridViewItem(Color color,int shu){
  switch (shu) {
    case 0:
      return Container(
        height: 100,
        width: 200,
        color: color,
        child: ListView(
          children: const <Widget>[
            _ListItem(title: 'listview第一种',),
            _ListItem(title: '2',),
            _ListItem(title: '3',),
            _ListItem(title: '4',),
          ],
        ),
      );
      break;
    case 1:
      return Container(
        height: 200,
        width: 300,
        color: color,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _ListItem(
              title: '$index'+'第二种',
            );
          },
          itemExtent: 30,
          itemCount: 30,
        ),
      );
    case 2:
      return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: color,
            height: 20,
            alignment: Alignment.center,
            child: Text('$index'+"分割线"),
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return Divider();
        },
        itemCount: 30,

      );
      break;
    case 3:
      return Container(
        height: 200,
        width: 300,
        color: color,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          reverse: true,//顺序颠倒
          itemBuilder: (BuildContext context, int index) {
            return _ListItem(
              title: '$index'+'竖屏',
            );
          },
          itemExtent: 30,
          itemCount: 30,
        ),
      );
    case 4:
      return Container(
        height: 200,
        width: 300,
        color: color,
        child: const _ListViewDemoState());
    case 5:
      return Container(
          height: 200,
          width: 300,
          color: color,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              return Container(
                height: 80,
                color: Colors.primaries[index % Colors.primaries.length],
                child: const Text("2_gridview",overflow: TextOverflow.ellipsis,maxLines: 1,),
              );
            },
            itemCount: 50,
          ));
    case 6:
      return Container(
          height: 200,
          width: 300,
          color: color,
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(50, (i) {
              return Container(
                child: const Text("count"),
                height: 80,
                color: Colors.primaries[i % Colors.primaries.length],
              );
            }),
          )
      );
    case 7:
      return Container(
          height: 200,
          width: 300,
          color: color,
          child:  GridView.custom(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                  child: const Text("custom"),
                  height: 80,
                  color: Colors.primaries[index % Colors.primaries.length]);
            }, childCount: 50),
          )
      );
    case 8:
      return Container(
          height: 200,
          width: 300,
          color: color,
          child: GridView.extent(
            maxCrossAxisExtent: 100,
            children: List.generate(50, (i) {
              return Container(
                child: const Text("extent"),
                height: 80,
                color: Colors.primaries[i % Colors.primaries.length],
              );
            }),
          )
      );
  }
}
class _ListViewDemoState extends StatefulWidget {
  const _ListViewDemoState({Key? key}) : super(key: key);

  @override
  State<_ListViewDemoState> createState() => _ListViewDemoStateState();
}

class _ListViewDemoStateState extends State<_ListViewDemoState> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController()
      ..addListener(() {
        print('${_controller.position}'+'获取当前位置');
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: RaisedButton(
            child: Text('滚动到指定位置'),
            onPressed: () {
              _controller.animateTo(400,
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics (),
            controller: _controller,
            reverse: false,
            itemBuilder: (BuildContext context, int index) {
              return _ListItem(
                title: '$index',
              );
            },
            itemCount: 30,
            itemExtent: 50,
          ),
        )
      ],);
  }
}



class _ListItem extends StatelessWidget {

  final String title;

  const _ListItem({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 45,
        alignment: Alignment.center,
        child: Text('$title'),
      ),
    );
  }
}