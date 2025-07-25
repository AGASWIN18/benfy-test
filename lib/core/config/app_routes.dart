import 'package:benfy/features/auth/presentation/screens/auth_home.dart';
import 'package:benfy/features/dashboard/presentation/screens/dashboard.dart';
import 'package:benfy/features/recipe/data/model/recipe_model.dart';
import 'package:benfy/features/recipe/presentation/screens/reciper_detail_screen.dart';
import 'package:get/get.dart';

/// Route Names
class AppRoutes {
  static const authHome = '/authHome';
  static const dashboard = '/dashboard';
  static const home = '/home';
  static const recipeDetail = '/recipeDetail';
}

/// Transition Manager
class TransitionHelper {
  TransitionHelper._();
  static final instance = TransitionHelper._();

  final Transition defaultTransition = Transition.cupertino;
  final Duration defaultDuration = const Duration(milliseconds: 600);
}

/// Main Route Manager
class RouteManager {
  static const initial = AppRoutes.authHome;

  /// list of GetPages
  static List<GetPage> getPages() {
    final t = TransitionHelper.instance;

    return [
      _buildPage(AppRoutes.authHome, () => const AuthHome(), t),
      _buildPage(AppRoutes.dashboard, () => Dashboard(), t),
      _buildPage(
        AppRoutes.recipeDetail,
        () => RecipeDetailScreen(recipeModel: Get.arguments as RecipeModel),
        t,
      ),
    ];
  }

  static GetPage _buildPage(
    String name,
    GetPageBuilder page,
    TransitionHelper t, {
    Bindings? binding,
  }) {
    return GetPage(
      name: name,
      page: page,
      transition: t.defaultTransition,
      transitionDuration: t.defaultDuration,
      binding: binding,
    );
  }
}
