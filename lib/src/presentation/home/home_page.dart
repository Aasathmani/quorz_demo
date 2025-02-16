import 'dart:convert';

import 'package:app_qoruz/src/application/home/home_bloc.dart';
import 'package:app_qoruz/src/application/home/home_event.dart';
import 'package:app_qoruz/src/application/home/home_state.dart';
import 'package:app_qoruz/src/core/app_constants.dart';
import 'package:app_qoruz/src/domain/database/core/app_database.dart';
import 'package:app_qoruz/src/presentation/core/app_page.dart';
import 'package:app_qoruz/src/presentation/core/base_state.dart';
import 'package:app_qoruz/src/presentation/core/theme/colors.dart';
import 'package:app_qoruz/src/presentation/core/theme/gradients.dart';
import 'package:app_qoruz/src/presentation/core/theme/text_styles.dart';
import 'package:app_qoruz/src/presentation/details/details_page.dart';
import 'package:app_qoruz/src/presentation/widgets/bordered_text_field.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  static String route = '/homePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  HomeBloc? bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<HomeBloc>(context);
    bloc!.message.listen((value) => showMessage(value));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AppPage(
          title: "Marketplace",
          retryOnTap: () {},
          processStateStream: bloc!.stream.map(
            (state) => state.processState,
          ),
          appBarTextStyle: TextStyles.titleSemiBold(context)!
              .copyWith(color: AppColors.white),
          appbarGradient: topLeftToBottomRightLinearGradient(
            GradientColors.appBarGradient,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: Units.kStandardPadding),
              child: InkWell(
                onTap: () {
                  showMessage("The menu icon tapped");
                },
                child: SvgPicture.asset(AppIcons.kAppBarMenu),
              ),
            ),
          ],
          child: getBodyLayout(context, state),
        );
      },
    );
  }

  Widget getBodyLayout(BuildContext context, HomeState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Units.kMPadding),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: Units.kLPadding),
              _getSearchTextField(context),
              const SizedBox(height: 14),
              _getFilterSuggestionList(context, state),
              const SizedBox(height: Units.kXLPadding),
              if (state.suggestion == SuggestionList.forYou ||
                  state.suggestion == SuggestionList.myRequests ||
                  state.suggestion == SuggestionList.topRating)
                const Padding(
                  padding: EdgeInsets.only(top: Units.kXXXLPadding),
                  child: Text("No data"),
                )
              else
                _getRecentListData(context, state),
            ],
          ),
          _getPostRequestButton(context),
        ],
      ),
    );
  }

  Widget _getPostRequestButton(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 4,
      child: InkWell(
        onTap: () {
          showMessage("Post request button tapped");
        },
        child: Container(
          height: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: AppColors.redOrange,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Units.kSPadding),
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  size: 25,
                  color: AppColors.white,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  "Post Request",
                  style: TextStyles.buttonSemiBold(context)!
                      .copyWith(color: AppColors.white),
                ),
                const SizedBox(
                  width: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getSearchTextField(BuildContext context) {
    return BorderedTextField(
      backgroundColor: AppColors.white,
      hintText: "Type your requirement here . . .",
      hintTextStyle: TextStyles.body1Regular(context)!
          .copyWith(fontWeight: FontWeight.w400, color: AppColors.corduroy),
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Units.kSPadding),
        child: Image.asset(
          AppIcons.kSearchProfile,
        ),
      ),
      onTextChanged: (value) {},
    );
  }

  Widget _getFilterSuggestionList(BuildContext context, HomeState state) {
    return Padding(
      padding: const EdgeInsets.only(right: Units.kSPadding),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            suggestionCommonWidget(
              SuggestionList.forYou,
              () {
                showMessage("For you category tapped");
                bloc!.add(
                  SuggestionListTapped(SuggestionList.forYou),
                );
              },
              state.suggestion == SuggestionList.forYou,
            ),
            const SizedBox(
              width: 10,
            ),
            suggestionCommonWidget(
              SuggestionList.recent,
              () {
                showMessage("recent category tapped");
                bloc!.add(
                  SuggestionListTapped(
                    SuggestionList.recent,
                  ),
                );
              },
              state.suggestion == SuggestionList.recent,
            ),
            const SizedBox(
              width: 10,
            ),
            suggestionCommonWidget(
              SuggestionList.myRequests,
              () {
                showMessage("My request category tapped");
                bloc!.add(
                  SuggestionListTapped(
                    SuggestionList.myRequests,
                  ),
                );
              },
              state.suggestion == SuggestionList.myRequests,
            ),
            const SizedBox(
              width: 10,
            ),
            suggestionCommonWidget(
              SuggestionList.topRating,
              () {
                showMessage("Top rating category tapped");
                bloc!.add(
                  SuggestionListTapped(
                    SuggestionList.topRating,
                  ),
                );
              },
              state.suggestion == SuggestionList.topRating,
            ),
          ],
        ),
      ),
    );
  }

  Widget suggestionCommonWidget(
    String name,
    VoidCallback onTap,
    bool selection,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          color:
              selection ? AppColors.redCon.withOpacity(0.1) : AppColors.white,
          border: Border.all(
            color: selection ? AppColors.redCon : AppColors.grey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Center(
            child: Row(
              children: [
                if (name == SuggestionList.topRating)
                  SvgPicture.asset(AppIcons.kIcStar),
                Text(
                  name,
                  style: TextStyles.body1Regular(context)!.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getRecentListData(BuildContext context, HomeState state) {
    final ScrollController scrollController = ScrollController();
    final recentList = state.recentList;
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !(state.isFetching ?? true)) {
        bloc?.add(PaginationList(state.pageCount + 1));
      }
    });
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        // shrinkWrap: true,
        itemCount: recentList?.length,
        itemBuilder: (context, index) {
          final item = state.recentList![index];
          return Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Units.kLPadding,
                        vertical: Units.kLPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _getProfileImageAndArrow(context, item),
                          const SizedBox(
                            height: 16,
                          ),
                          _getIconWithSlugText(context, item),
                          const SizedBox(
                            height: 12,
                          ),
                          const Divider(color: AppColors.lightGrey1),
                          const SizedBox(
                            height: 10,
                          ),
                          _getBudgetBrandTypeAndDescriptionText(context, item),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (item == recentList![1])
                _getNotifiLayout(context, state, "high value")
              else if (item == recentList[3])
                _getNotifiLayout(context, state, "expiring soon")
            ],
          );
        },
      ),
    );
  }

  Widget _getProfileImageAndArrow(BuildContext context, RecentList item) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsPage.route,
          arguments: DetailsPageArgument(
            recentList: item,
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getProfileImageWithNameAndDesignation(
            context,
            item,
          ),
          _getArrowIcon(context, item),
        ],
      ),
    );
  }

  Widget _getNotifiLayout(BuildContext context, HomeState state, String value) {
    return Positioned(
      top: 8,
      right: 20,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          gradient: value == "high value"
              ? bottomCenterToTopCenterGradient(
                  GradientColors.highValue,
                )
              : topCenterToBottomCenterGradient(
                  GradientColors.expiringSoon,
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Units.kMPadding),
          child: Row(
            children: [
              if (value == "high value")
                SvgPicture.asset(
                  AppIcons.kIcStarIcon,
                  height: 20,
                  width: 20,
                )
              else
                SvgPicture.asset(
                  AppIcons.kIcNotification,
                  height: 20,
                  width: 20,
                ),
              const SizedBox(
                width: 4,
              ),
              Text(
                value == "high value"
                    ? "High value".toUpperCase()
                    : "Expiring soon".toUpperCase(),
                style: TextStyles.buttonSemiBold(context)!.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getProfileImageWithNameAndDesignation(
    BuildContext context,
    RecentList item,
  ) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[200],
          child: ClipOval(
            child: CachedNetworkImage(
              width: 60,
              height: 60,
              imageUrl: item.profileImage ?? '',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Image.asset(AppIcons.kAvatarProfile),
              fit: BoxFit.cover,
            ),
          ),
        ),
        _getNameDesignationWithCreateDate(context, item),
      ],
    );
  }

  Widget _getNameDesignationWithCreateDate(
    BuildContext context,
    RecentList item,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Units.kSPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getNameText(context, item),
          const SizedBox(
            height: 4,
          ),
          _getCompanyWithDesignationText(context, item),
          const SizedBox(
            height: 4,
          ),
          _getClockIconWithCreateDate(context, item),
        ],
      ),
    );
  }

  Widget _getNameText(BuildContext context, RecentList item) {
    return Text(
      item.name!,
      style: TextStyles.body1Regular(context)!
          .copyWith(fontWeight: FontWeight.w600),
    );
  }

  Widget _getCompanyWithDesignationText(BuildContext context, RecentList item) {
    return SizedBox(
      width: 200,
      child: Text(
        "${item.company} at ${item.designation}",
        style:
            TextStyles.labelRegular(context)!.copyWith(color: AppColors.grey),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  Widget _getClockIconWithCreateDate(BuildContext context, RecentList item) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.kIcClock),
        const SizedBox(
          width: 4,
        ),
        Text(
          item.createdAt!,
          style:
              TextStyles.buttonNormal(context)!.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }

  Widget _getArrowIcon(BuildContext context, RecentList item) {
    return const Icon(
      Icons.arrow_forward_ios_rounded,
      size: 20,
      color: AppColors.grey,
    );
  }

  Widget _getIconWithSlugText(BuildContext context, RecentList item) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.kAgencyIcon),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 260,
          child: Text(
            item.slug!,
            style: TextStyles.captionRegular(context)!.copyWith(
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget _getBudgetBrandTypeAndDescriptionText(
    BuildContext context,
    RecentList item,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getBudgetText(context, item),
        const SizedBox(
          height: 4,
        ),
        _getBrandText(context, item),
        const SizedBox(
          height: 4,
        ),
        _getCitiesText(context, item),
        const SizedBox(
          height: 4,
        ),
        getDescriptionText(context, item),
        const SizedBox(
          height: 10,
        ),
        _getLocationWithLocationListText(context, item),
        const SizedBox(
          height: 10,
        ),
        getSocialMediaAndHobbiesText(context, item),
      ],
    );
  }

  Widget _getBudgetText(BuildContext context, RecentList item) {
    return Text(
      "Budget: ₹1,50,00",
      style: TextStyles.body1Regular(context)!
          .copyWith(fontWeight: FontWeight.w400),
    );
  }

  Widget _getBrandText(BuildContext context, RecentList item) {
    return Text(
      "Brand: WanderFit Luggage",
      style: TextStyles.body1Regular(context)!
          .copyWith(fontWeight: FontWeight.w400),
    );
  }

  Widget _getCitiesText(BuildContext context, RecentList item) {
    return Text(
      item.cities == "null"
          ? "Location: Goa & Kerala"
          : "Location: ${item.cities!.replaceAll("[", "").replaceAll("]", "")}",
      style: TextStyles.body1Regular(context)!
          .copyWith(fontWeight: FontWeight.w400),
    );
  }

  Widget getDescriptionText(BuildContext context, RecentList item) {
    return Text(
      "Type: ${item.description}",
      style: TextStyles.body1Regular(context)!
          .copyWith(fontWeight: FontWeight.w400, height: 1.5),
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _getLocationWithLocationListText(
    BuildContext context,
    RecentList item,
  ) {
    return Container(
      height: 40,
      width: 250,
      decoration: const BoxDecoration(
        color: AppColors.lightBlueCon,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          SvgPicture.asset(
            AppIcons.kIcMap,
            height: 20,
            width: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 150,
            child: Text(
              item.cities == "null"
                  ? "Goa & Kerala"
                  : item.cities!.replaceAll("[", "").replaceAll("]", ""),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget getSocialMediaAndHobbiesText(BuildContext context, RecentList item) {
    return Row(
      children: [
        _getInstagramLayout(context, item),
        const SizedBox(
          width: 10,
        ),
        _getHobbiesLayout(context, item),
      ],
    );
  }

  Widget _getInstagramLayout(BuildContext context, RecentList item) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        color: AppColors.lightBlueCon,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          SvgPicture.asset(
            AppIcons.kInstagram,
            height: 20,
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Units.kSPadding),
            child: Text(
              _getFollowerRange(item.followersRage ?? ""),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getHobbiesLayout(BuildContext context, RecentList item) {
    return Container(
      height: 40,
      width: 140,
      decoration: const BoxDecoration(
        color: AppColors.lightBlueCon,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          SvgPicture.asset(
            AppIcons.kInstagram,
            height: 20,
            width: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 80,
            child: Text(
              _getCategories(item.categories),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  String _getFollowerRange(String? followersRange) {
    if (followersRange == null || followersRange.isEmpty) return "No Data";

    final minMatch =
        RegExp(r'ig_followers_min:\s*([\w\d]+)').firstMatch(followersRange);
    final maxMatch =
        RegExp(r'ig_followers_max:\s*([\w\d]+)').firstMatch(followersRange);

    final min = minMatch?.group(1) ?? "1k";
    final max = maxMatch?.group(1) ?? "100k";

    return "$min - $max";
  }

  String _getCategories(String? categoriesJson) {
    if (categoriesJson == null || categoriesJson.isEmpty) {
      return "No Categories";
    }
    try {
      final List<dynamic> decodedList =
          jsonDecode(categoriesJson) as List<dynamic>;
      return decodedList.cast<String>().join(", ");
    } catch (e) {
      return "LifeStyle,Passion";
    }
  }
}

class DetailsPageArgument {
  RecentList? recentList;
  DetailsPageArgument({
    this.recentList,
  });
}
