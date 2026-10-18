import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../repositories/campus_menu_repository.dart';
import '../viewmodels/order_viewmodel.dart';
import '../presentation/screens/booking_screen.dart';
import '../presentation/screens/detail_screen.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/login_screen.dart';
import '../presentation/screens/success_screen.dart';

GoRouter createAppRouter(OrderViewModel order) => GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (_, _) => const LoginScreen()),
    GoRoute(path: '/home', builder: (_, _) => const HomeScreen()),
    GoRoute(
      path: '/menu/:id',
      redirect: (_, state) =>
          const CampusMenuRepository().find(state.pathParameters['id']!) == null ? '/home' : null,
      builder: (_, state) => _DetailRoute(order: order, id: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/booking',
      builder: (_, _) => BookingScreen(order: order),
    ),
    GoRoute(
      path: '/success',
      redirect: (_, _) => order.completed ? null : '/home',
      builder: (_, _) => SuccessScreen(order: order),
    ),
  ],
  errorBuilder: (context, _) => Scaffold(
    body: Center(
      child: TextButton(
        onPressed: () => context.go('/home'),
        child: const Text('Kembali ke Beranda'),
      ),
    ),
  ),
);

class _DetailRoute extends StatefulWidget {
  const _DetailRoute({required this.order, required this.id});
  final OrderViewModel order;
  final String id;
  @override
  State<_DetailRoute> createState() => _DetailRouteState();
}

class _DetailRouteState extends State<_DetailRoute> {
  @override
  void initState() {
    super.initState();
    widget.order.select(const CampusMenuRepository().find(widget.id)!);
  }

  @override
  Widget build(BuildContext context) => DetailScreen(order: widget.order);
}
