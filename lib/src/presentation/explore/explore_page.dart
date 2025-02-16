import 'package:app_qoruz/src/application/explore/explore_bloc.dart';
import 'package:app_qoruz/src/application/explore/explore_state.dart';
import 'package:app_qoruz/src/presentation/core/app_page.dart';
import 'package:app_qoruz/src/presentation/core/base_state.dart';
import 'package:app_qoruz/src/presentation/core/theme/colors.dart';
import 'package:app_qoruz/src/presentation/core/theme/gradients.dart';
import 'package:app_qoruz/src/presentation/core/theme/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorePage extends StatefulWidget {
  static String route = "/explore";
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends BaseState<ExplorePage> {
  ExploreBloc? bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<ExploreBloc>(context);
    bloc!.message.listen((value) => showMessage(value));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExploreBloc, ExploreState>(
        listener: (context, state) {},
        builder: (context, state) {
          return AppPage(
            title: "",
            retryOnTap: () {},
            processStateStream: bloc!.stream.map(
              (state) => state.processState,
            ),
            appBarTextStyle: TextStyles.titleSemiBold(context)!
                .copyWith(color: AppColors.white),
            appbarGradient: topLeftToBottomRightLinearGradient(
              GradientColors.appBarGradient,
            ),
            child: const Center(
              child: Text("Empty page"),
            ),
          );
        });
  }
}
