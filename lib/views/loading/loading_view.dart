import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routs/app_routes.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  void initState() {
    super.initState();
    _navigateAfterLoading();
  }

  _navigateAfterLoading() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offAllNamed(AppRoutes.home); // เปลี่ยนเส้นทาง
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
