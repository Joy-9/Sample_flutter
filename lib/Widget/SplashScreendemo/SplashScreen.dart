import 'package:flutter/material.dart';

import '../../MyHomePage.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    /*动画事件监听器，
    它可以监听到动画的执行状态，
    我们这里只监听动画是否结束，
    如果结束则执行页面跳转动作。 */
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MyHomePage()),
                (route) => route == null);
      }
    });
    //播放动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      //透明度动画组件
      opacity: _animation, //执行动画
      child: Image.network(
        //网络图片
          'https://img0.baidu.com/it/u=2244068358,4054129352&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889',
          scale: 2.0, //进行缩放
          fit: BoxFit.cover // 充满父容器
      ),
    );
  }
}
