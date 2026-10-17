import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';
import '../widgets/design_icon.dart';
import '../widgets/labeled_field.dart';
import '../widgets/primary_action.dart';
import '../widgets/section_card.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _hidden = true, _remember = false;
  String _role = 'Mahasiswa';
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _message(String message) =>
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
  void _login() {
    if (_form.currentState!.validate()) context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: Space.padding,
          child: Form(
            key: _form,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: Space.logo,
                      height: Space.logo,
                      decoration: const BoxDecoration(
                        color: AppColors.surface,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(Space.small),
                      child: Image.asset('assets/figma/login_00.png'),
                    ),
                    const Positioned(
                      right: 0,
                      bottom: 0,
                      child: DesignIcon('login_02.svg'),
                    ),
                  ],
                ),
                Space.gap,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DesignIcon('login_01.svg'),
                    Space.rowGap,
                    StatusPill(
                      'Kantin Digital Terintegrasi',
                      color: AppColors.blue,
                      background: AppColors.pale,
                    ),
                  ],
                ),
                Space.gap,
                Text(
                  'Selamat Datang Kembali!',
                  textAlign: TextAlign.center,
                  style: text.headlineLarge,
                ),
                Space.gap,
                Text(
                  'Masuk dengan akun civitas kampus untuk\npesan makanan favoritmu',
                  textAlign: TextAlign.center,
                  style: text.bodyMedium,
                ),
                Space.block,
                Container(
                  padding: const EdgeInsets.all(Space.tiny),
                  decoration: BoxDecoration(
                    color: AppColors.pale,
                    borderRadius: BorderRadius.circular(Space.radius),
                  ),
                  child: Row(
                    children: [
                      for (final (role, icon) in [
                        ('Mahasiswa', 'login_03.svg'),
                        ('Dosen / Staff', 'login_04.svg'),
                      ])
                        Expanded(
                          child: Material(
                            color: _role == role
                                ? AppColors.surface
                                : AppColors.pale,
                            borderRadius: BorderRadius.circular(Space.radius),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(Space.radius),
                              onTap: () => setState(() => _role = role),
                              child: Padding(
                                padding: Space.cardPadding,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DesignIcon(icon),
                                    Space.rowGap,
                                    Text(role, style: text.labelMedium),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Space.block,
                LabeledField(
                  label: 'Email Kampus atau NIM / NIP',
                  hint: 'contoh: 21060123@ui.ac.id atau NIM',
                  controller: _email,
                  leading: const DesignIcon('login_05.svg'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Isi email atau NIM dulu.'
                      : null,
                ),
                Space.block,
                LabeledField(
                  label: 'Kata Sandi',
                  hint: '••••••••',
                  controller: _password,
                  obscure: _hidden,
                  leading: const DesignIcon('login_06.svg'),
                  trailing: IconButton(
                    tooltip: _hidden
                        ? 'Tampilkan kata sandi'
                        : 'Sembunyikan kata sandi',
                    onPressed: () => setState(() => _hidden = !_hidden),
                    icon: const DesignIcon('login_07.svg'),
                  ),
                  validator: (value) => value == null || value.length < 6
                      ? 'Gunakan minimal 6 karakter.'
                      : null,
                ),
                Space.gap,
                Row(
                  children: [
                    SizedBox(
                      width: Space.section,
                      child: Checkbox(
                        value: _remember,
                        onChanged: (value) =>
                            setState(() => _remember = value ?? false),
                      ),
                    ),
                    Space.rowGap,
                    Text('Ingat saya', style: text.bodySmall),
                    const Spacer(),
                    TextButton(
                      onPressed: () => _message(
                        'Hubungi admin kampus untuk mengatur ulang sandi.',
                      ),
                      child: const Text('Lupa Password?'),
                    ),
                  ],
                ),
                Space.gap,
                PrimaryAction(
                  label: 'Masuk ke KantinKu',
                  onPressed: _login,
                  trailing: const DesignIcon('login_08.svg'),
                ),
                Space.block,
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Space.medium,
                      ),
                      child: Text(
                        'ATAU MASUK DENGAN SSO KAMPUS',
                        style: text.labelSmall?.copyWith(
                          color: AppColors.muted,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                Space.block,
                OutlinedButton(
                  onPressed: () => _message(
                    'SSO tersedia saat integrasi akun kampus diaktifkan.',
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(Space.button),
                    backgroundColor: AppColors.surface,
                    side: const BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Space.radius),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DesignIcon('login_09.svg'),
                      Space.rowGap,
                      Flexible(child: Text('Single Sign-On (SSO) Universitas')),
                    ],
                  ),
                ),
                Space.block,
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    Text('Belum punya akun?', style: text.bodySmall),
                    TextButton(
                      onPressed: () => _message(
                        'Pendaftaran akun mengikuti data civitas kampus.',
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Daftar Akun Baru'),
                          DesignIcon('login_10.svg'),
                        ],
                      ),
                    ),
                  ],
                ),
                Space.gap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const DesignIcon('login_11.svg'),
                    Space.rowGap,
                    Text(
                      'Terkoneksi aman dengan Jaringan Kampus',
                      style: text.bodySmall,
                    ),
                  ],
                ),
                Space.block,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
