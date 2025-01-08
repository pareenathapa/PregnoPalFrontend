import 'package:auto_route/auto_route.dart';

import '../../config/routes/route_paths.dart';
import '../../di/main_di.dart';
import 'token_storage.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    try {
      final accessToken = await locator<TokenStorage>().accessToken;

      // If the user is not logged in, block the navigation and navigate to the login screen.
      if (accessToken == null || accessToken.isEmpty) {
        router
            .markUrlStateForReplace(); // Mark the current URL state for replacement.
        resolver.next(false); // Block the navigation.
        router.pushNamed(
          "${AppRoutePoints.authenticationRoute}/${AppRoutePoints.loginRoute}",
        ); // Navigate to the login screen.
      } else {
        // If the user is authenticated, allow the navigation to proceed.
        resolver.next();
      }
    } catch (e) {
      // If there is an error (e.g., settings retrieval fails), block the navigation.
      resolver.next(false);
    }
  }
}
