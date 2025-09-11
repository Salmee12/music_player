import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_player/core/provider/current_user_notifier.dart';
import 'package:music_player/core/theme/theme.dart';


import 'features/auth/view/pages/signup_page.dart';
import 'features/auth/viewmodel/auth_viewmodel.dart';
import 'features/home/view/pages/home_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'features/home/view/pages/upload_song_page.dart';




void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;
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
      home: currentUser== null? const SignupPage() : HomePage(),// UploadSongPage(),//
      debugShowCheckedModeBanner: false,
    );
  }
}


//to generate file: dart run build_runner build -d
