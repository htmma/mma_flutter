import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mma_flutter/common/view/root_tab.dart';
import 'package:mma_flutter/common/view/splash_screen.dart';
import 'package:mma_flutter/user/provider/auth_change_provider.dart';
import 'package:mma_flutter/user/screen/init_nickname_screen.dart';
import 'package:mma_flutter/user/screen/join_screen.dart';
import 'package:mma_flutter/user/screen/login_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final provider = ref.read(authChangeProvider);
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => RootTab(),
        routes: [],
      ),
      GoRoute(
        path: '/login',
        name: LoginScreen.routeName,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/splash',
        name: SplashScreen.routeName,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/init_nickname',
        name: InitNicknameScreen.routeName,
        builder: (context, state) => InitNicknameScreen(),
      ),
    ],
    initialLocation: '/splash',
    refreshListenable: provider, /// provider 상태 변경될 때 redirect 실행
    redirect: (context, state) {
      return provider.redirectLogic(state);
    },
  );
});
