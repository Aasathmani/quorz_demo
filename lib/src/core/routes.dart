import 'package:app_qoruz/src/application/details/details_bloc.dart';
import 'package:app_qoruz/src/application/explore/explore_bloc.dart';
import 'package:app_qoruz/src/presentation/core/base_screen_template.dart';
import 'package:app_qoruz/src/presentation/details/details_page.dart';
import 'package:app_qoruz/src/presentation/explore/explore_page.dart';
import 'package:app_qoruz/src/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_qoruz/src/application/core/bloc_provider.dart';
import 'package:app_qoruz/src/application/web_view/web_view_bloc.dart';
import 'package:app_qoruz/src/presentation/splash/splash_page.dart';
import 'package:app_qoruz/src/presentation/web_view/web_view_page.dart';

final Map<String, Widget Function(BuildContext context)> routes = {
  SplashPage.route: (_) => BlocProvider(
        create: (_) => provideSplashBloc(),
        child: const SplashPage(),
      ),
  BaseScreenTemplate.route: (_) => BaseScreenTemplate(),
  HomePage.route: (_) => BlocProvider(
        create: (_) => provideHomeBloc(),
        child: const HomePage(),
      ),
  ExplorePage.route: (_) => BlocProvider(
        create: (_) => ExploreBloc(),
        child: const ExplorePage(),
      )
  // LoginPage.route: (_) => BlocProvider(
  //       create: (_) => provideLoginBloc(),
  //       child: const LoginPage(),
  //     ),
  // ProfilePage.route: (_) => BlocProvider(
  //       create: (_) => provideProfileBloc(),
  //       child: const ProfilePage(),
  //     ),
};

Route<dynamic>? generatedRoutes(RouteSettings settings) {
  final uri = Uri.parse(settings.name ?? '');
  debugPrint("URI.PATH : ${uri.path}");
  debugPrint("URI.queryParams : ${uri.queryParameters}");
  debugPrint("Settings : ${settings.name}");
  debugPrint("Arguments :  ${settings.arguments ?? "null"}");

  switch (uri.path) {
    case WebViewPage.route:
      if (settings.arguments != null && settings.arguments is WebViewArgument) {
        return _getWebViewRoute(
          settings,
          settings.arguments! as WebViewArgument,
        );
      }
    case DetailsPage.route:
      if (settings.arguments != null &&
          settings.arguments is DetailsPageArgument) {
        return _getDetailsPage(
          settings,
          settings.arguments! as DetailsPageArgument,
        );
      }
    // case OtpPage.route:
    //   if (settings.arguments != null &&
    //       settings.arguments is LoginPageArguments) {
    //     return _getOtpPageRoute(
    //       settings,
    //       settings.arguments! as LoginPageArguments,
    //     );
    //   }
  }
  return null;
}

MaterialPageRoute _getWebViewRoute(
  RouteSettings settings,
  WebViewArgument argument,
) {
  return MaterialPageRoute(
    builder: (context) => BlocProvider<WebViewBloc>(
      create: (context) => provideWebViewBloc(argument),
      child: const WebViewPage(),
    ),
    settings: settings,
  );
}

MaterialPageRoute _getDetailsPage(
  RouteSettings settings,
  DetailsPageArgument argument,
) {
  return MaterialPageRoute(
    builder: (context) => BlocProvider<DetailsBloc>(
      create: (context) => provideDetailsBloc(argument),
      child: const DetailsPage(),
    ),
    settings: settings,
  );
}

// MaterialPageRoute _getOtpPageRoute(
//   RouteSettings settings,
//   LoginPageArguments argument,
// ) {
//   return MaterialPageRoute(
//     builder: (context) => BlocProvider<OtpBloc>(
//       create: (context) => provideOtpBloc(argument),
//       child: const OtpPage(),
//     ),
//     settings: settings,
//   );
// }
