import 'package:flutter/material.dart';

import '../viewmodels/menu_viewmodel.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final MenuViewModel viewModel = MenuViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.addListener(_refresh);
    viewModel.loadMenus();
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    viewModel.removeListener(_refresh);
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu KantinKu'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: viewModel.isLoading
            ? const CircularProgressIndicator()
            : viewModel.errorMessage != null
            ? Text(viewModel.errorMessage!)
            : viewModel.menus.isEmpty
            ? const Text('Belum ada menu tersedia')
            : ListView.builder(
                itemCount: viewModel.menus.length,
                itemBuilder: (context, index) {
                  final menu = viewModel.menus[index];

                  return ListTile(
                    title: Text(menu.name),
                    subtitle: Text('Rp ${menu.price.toStringAsFixed(0)}'),
                  );
                },
              ),
      ),
    );
  }
}
