import 'dart:math';

import 'package:demo02/provider/demo_provider.dart';
import 'package:demo02/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemExtent: 100,
                itemBuilder: (context, index) {
                  debugPrint("----重构 ${DateTime.now().millisecond}");
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 100,
                    height: 10,
                    color: Colors.primaries[index],
                  );
                },
                itemCount: 10,
              ),
            ),

            /// 加一个Consumer包裹在外面，其他的可以不重绘，转而只重绘该组件
            Consumer(builder: (context, ref, _) {
              final demo = ref.watch(demoProvider);
              return Text(demo.toString());
            }),
            ElevatedButton(
              child: const Text("测试按钮"),
              onPressed: () {
                ref.read(demoProvider.notifier).add(10);
              },
            ),
            Consumer(builder: (context, ref, _) {
              debugPrint("----开始重绘用户信息---${Random().nextInt(100)}");
              final userInfo = ref.watch(userProvider);
              return Column(
                children: [
                  Text(userInfo.username ?? '用户名'),
                  Text(userInfo.id == null ? '用户id' : userInfo.id.toString()),
                  Text(userInfo.description ?? '用户描述'),
                ],
              );
            }),
            ElevatedButton(
              child: const Text('给用户赋值'),
              onPressed: () {
                debugPrint("给用户开始赋值。。。");
                ref.read(userProvider.notifier).updateUser(
                      'keppelfei@gmail.com',
                      10086,
                      'this is a fantastic description, pls be free to help you improve',
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
