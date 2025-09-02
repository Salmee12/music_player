import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_player/core/provider/current_user_notifier.dart';
import 'package:music_player/core/theme/theme.dart';
import 'package:music_player/features/home/view/home_page.dart';
import 'package:music_player/features/home/view/upload_song_page.dart';

import 'features/auth/view/pages/signup_page.dart';
import 'features/auth/viewmodel/auth_viewmodel.dart';




void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  await container.read(authViewModelProvider.notifier).initSharedPreferences();
  await container.read(authViewModelProvider.notifier).getData();
            runApp(
       UncontrolledProviderScope(
           container: container,
           child: MyApp()));
}

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserNotifierProvider);
    return MaterialApp(
      title: 'Music App',
      theme: AppTheme.darkThemeMode,
      home: currentUser== null? const SignupPage() : UploadSongPage(), //HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
