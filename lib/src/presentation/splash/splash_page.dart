import 'package:app_qoruz/src/presentation/core/base_screen_template.dart';
import 'package:app_qoruz/src/presentation/core/theme/colors.dart';
import 'package:app_qoruz/src/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_qoruz/src/application/splash/splash_bloc.dart';
import 'package:app_qoruz/src/application/splash/splash_event.dart';
import 'package:app_qoruz/src/application/splash/splash_state.dart';
import 'package:app_qoruz/src/core/app_constants.dart';
import 'package:app_qoruz/src/presentation/core/base_state.dart';

class SplashPage extends StatefulWidget {
  static String route = '/';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashState();
}

class _SplashState extends BaseState<SplashPage> {
  SplashBloc? _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_bloc == null) {
      _bloc = BlocProvider.of<SplashBloc>(context);
      _bloc!.add(RedirectPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
       // if (state.redirectToLogin ?? false) {
          Navigator.pushReplacementNamed(context, BaseScreenTemplate.route);
      //  }
      },
      builder: (context, state) {
        final width = MediaQuery.of(context).size.width;

        return Scaffold(
          body: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
