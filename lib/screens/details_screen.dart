import 'package:assesment/config/app_router.dart';
import 'package:assesment/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  // static Route route() {
  //   return MaterialPageRoute(
  //       builder: (_) => const DetailsScreen(),
  //       settings: const RouteSettings(name: RouteNames.detailsScreen));
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Details Screen'),
    );
  }
}
