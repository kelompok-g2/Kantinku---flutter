import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'navigation/app_router.dart';
import 'presentation/theme/app_theme.dart';
import 'viewmodels/order_viewmodel.dart';

void main() => runApp(const KantinKuApp());

class KantinKuApp extends StatefulWidget {
  const KantinKuApp({super.key});
  @override
  State<KantinKuApp> createState() => _KantinKuAppState();
}

class _KantinKuAppState extends State<KantinKuApp> {
  final order = OrderViewModel();
  late final GoRouter router = createAppRouter(order);
  @override
  void dispose() { router.dispose(); order.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'KantinKu', debugShowCheckedModeBanner: false,
    theme: buildAppTheme(), routerConfig: router,
    builder: (context, child) => ColoredBox(color: AppColors.background,
      child: Center(child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: Space.desktopWidth), child: child))),
  );
}
