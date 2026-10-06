import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sari_sari_store/app/router.dart';
import 'package:sari_sari_store/app/theme.dart';
import 'package:sari_sari_store/app/splash_screen.dart';
import 'package:sari_sari_store/app/providers.dart';

class SariSariStoreApp extends ConsumerStatefulWidget {
  const SariSariStoreApp({super.key});

  @override
  ConsumerState<SariSariStoreApp> createState() => _SariSariStoreAppState();
}

class _SariSariStoreAppState extends ConsumerState<SariSariStoreApp> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    // Initialize database
    ref.read(databaseProvider);
    // Simulate minimum splash time for better UX
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isInitialized = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sari Sari Store',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: _isInitialized ? const MainShell() : const SplashScreen(),
    );
  }
}