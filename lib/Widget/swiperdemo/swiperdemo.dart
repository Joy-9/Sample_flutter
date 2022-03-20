import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';




class swiperdemo extends StatefulWidget {
  const swiperdemo({Key? key}) : super(key: key);

  @override
  State<swiperdemo> createState() => _swiperdemoState();
}

class _swiperdemoState extends State<swiperdemo> {
  var customLayoutOption = CustomLayoutOption(
      startIndex: -1,
      stateCount: 3
  );



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customLayoutOption.addRotate([
      -45.0/180,
      0.0,
      45.0/180
    ]);
    customLayoutOption.addTranslate([
      Offset(-370.0, -40.0),
      Offset(0.0, 0.0),
      Offset(370.0, -40.0)
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("swiperdemo"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.blueGrey,
              height: 250,
              width: 250,
              child: Swiper(
                itemHeight: 200,
                itemWidth: 200,
                containerHeight: 200,
                containerWidth: 200,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    "https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF",
                    fit: BoxFit.fill,
                    height: 200,
                    width: 200,
                  );
                },
                itemCount: 3,
                viewportFraction: 0.8,
                scale: 0.9,
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.all(1)),
                control: const SwiperControl(
                    color: Colors.red,
                    disableColor: Colors.grey,
                    iconPrevious: Icons.arrow_back_ios,
                    iconNext: Icons.arrow_forward_ios),
                // autoplay: true,
                duration: 3000,
                loop: false,
              ),
            ),Container(
                color:Colors.blueGrey,
                height: 250,
                width: 250,
                child: Swiper(
                  layout: SwiperLayout.CUSTOM,
                  customLayoutOption: customLayoutOption,
                  itemWidth: 300.0,
                  itemHeight: 200.0,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey,
                      child: Center(
                        child: Text("$index"),
                      ),
                    );
                  },
                  pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.all(1)),
                  control: const SwiperControl(
                      color: Colors.red,
                      disableColor: Colors.grey,
                      iconPrevious: Icons.arrow_back_ios,
                      iconNext: Icons.arrow_forward_ios),
                  itemCount: 10,
                )

            ),
            ElevatedButton(onPressed: (){
              launch("https://pub.flutter-io.cn/packages/card_swiper");
            }, child: Text("这是学习链接"))
          ],
        ));
  }
}
