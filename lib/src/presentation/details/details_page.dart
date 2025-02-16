import 'package:app_qoruz/src/application/details/details_bloc.dart';
import 'package:app_qoruz/src/application/details/details_state.dart';
import 'package:app_qoruz/src/core/app_constants.dart';
import 'package:app_qoruz/src/domain/database/core/app_database.dart';
import 'package:app_qoruz/src/presentation/core/app_page.dart';
import 'package:app_qoruz/src/presentation/core/base_state.dart';
import 'package:app_qoruz/src/presentation/core/theme/colors.dart';
import 'package:app_qoruz/src/presentation/core/theme/text_styles.dart';
import 'package:app_qoruz/src/presentation/widgets/app_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsPage extends StatefulWidget {
  static const route = '/detailsPage';
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends BaseState<DetailsPage> {
  DetailsBloc? bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<DetailsBloc>(context);
    bloc!.message.listen((value) => showMessage(value));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBloc, DetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final RecentList? item = state.recentList;
        return AppPage(
          title: "",
          retryOnTap: () {},
          isBottomBarRequired: false,
          processStateStream: bloc!.stream.map((state) => state.processState),
          actions: [
            _getActionsList(context, state),
          ],
          child: _getBodyLayout(context, state, item),
        );
      },
    );
  }

  Widget _getActionsList(BuildContext context, DetailsState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Units.kXLPadding),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              showMessage("The delete button tapped");
            },
            child: SvgPicture.asset(AppIcons.kGradientDelete),
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              showMessage("The share button tapped");
            },
            child: SvgPicture.asset(AppIcons.kGradientShare),
          ),
        ],
      ),
    );
  }

  Widget _getBodyLayout(
    BuildContext context,
    DetailsState state,
    RecentList? item,
  ) {
    return item == null
        ? const Center(child: CircularProgressIndicator())
        : Stack(
            children: [
              Column(
                children: [
                  _getProfileDetails(context, item),
                  _getAllDetails(context, item),
                ],
              ),
              Positioned(
                bottom: 0,
                child: _getExpiryInformationWithButton(context, item, state),
              ),
            ],
          );
  }

  Widget _getProfileDetails(BuildContext context, RecentList item) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.lightBlueMoon),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Units.kXLPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getProfileImageWithNameAndDesignation(
              context,
              item,
            ),
            _getCreateDate(context, item),
          ],
        ),
      ),
    );
  }

  Widget _getProfileImageWithNameAndDesignation(
    BuildContext context,
    RecentList item,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Units.kMPadding),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[200],
                child: ClipOval(
                  child: CachedNetworkImage(
                    width: 60,
                    height: 60,
                    imageUrl: item.profileImage ?? '',
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Image.asset(AppIcons.kAvatarProfile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              _getNameDesignationWithCreateDate(context, item),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _getNameDesignationWithCreateDate(
    BuildContext context,
    RecentList item,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Units.kMPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getNameText(context, item),
          const SizedBox(
            height: 4,
          ),
          _getCompanyWithDesignationText(context, item),
          getCompanyWithIcon(context, item),
        ],
      ),
    );
  }

  Widget _getNameText(BuildContext context, RecentList item) {
    return Row(
      children: [
        Text(
          item.name!,
          style: TextStyles.body1Regular(context)!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 4,
        ),
        Image.asset(AppIcons.kIcLinkedIn),
        const SizedBox(
          width: 4,
        ),
        SvgPicture.asset(AppIcons.kIcVerify),
      ],
    );
  }

  Widget _getCompanyWithDesignationText(BuildContext context, RecentList item) {
    return SizedBox(
      width: 150,
      child: Text(
        item.designation ?? "Senior Sales Manager",
        style:
            TextStyles.labelRegular(context)!.copyWith(color: AppColors.grey),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  Widget _getCreateDate(BuildContext context, RecentList item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Units.kMPadding),
      child: Text(
        item.createdAt!,
        style:
            TextStyles.labelRegular(context)!.copyWith(color: AppColors.grey),
      ),
    );
  }

  Widget getCompanyWithIcon(BuildContext context, RecentList item) {
    return Padding(
      padding: const EdgeInsets.only(top: Units.kXSPadding),
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.kBuilding),
          const SizedBox(
            width: 6,
          ),
          Text(
            item.company!,
            style: TextStyles.labelRegular(context)!
                .copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }

  Widget _getAllDetails(BuildContext context, RecentList item) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: Units.kStandardPadding,
            right: Units.kStandardPadding,
            bottom: 110,
          ),
          child: Column(
            children: [
              _getLookingForAndHighLightLayout(context, item),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getLookingForAndHighLightLayout(
      BuildContext context, RecentList item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getLookingForData(context, item),
        _getHighLightsLayout(context, item),
        _getBudgetBrandTypeAndDescriptionText(context, item),
        _getShareViaWhatsappAndLinked(context, item),
        _getKeyHighLightDetails(context, item),
      ],
    );
  }

  Widget _getLookingForData(BuildContext context, RecentList item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Units.kSPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Looking for",
            style: TextStyles.captionRegular(context)!.copyWith(
              color: AppColors.grey2,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          _getIconWithSlugText(context, item),
          const SizedBox(
            height: 8,
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _getIconWithSlugText(BuildContext context, RecentList item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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

  Widget _getHighLightsLayout(BuildContext context, RecentList item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Highlights",
          style: TextStyles.captionRegular(context)!
              .copyWith(fontWeight: FontWeight.w600, color: AppColors.grey),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Units.kSPadding),
          child: Row(
            children: [
              _getBudgetLayout(context, item),
              _getBrandLayout(context, item),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getBudgetLayout(BuildContext context, RecentList item) {
    return Container(
      height: 20,
      decoration: const BoxDecoration(
        color: AppColors.mildWhite,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Units.kSPadding),
        child: Row(
          children: [
            Text(
              "₹",
              style: TextStyles.captionRegular(context)!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              "Budget: 1,45,000",
              style: TextStyles.captionRegular(context)!
                  .copyWith(fontWeight: FontWeight.w600, color: AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBrandLayout(BuildContext context, RecentList item) {
    return Container(
      height: 20,
      decoration: const BoxDecoration(
        color: AppColors.mildWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Units.kSPadding),
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.kIcMic),
            const SizedBox(
              width: 6,
            ),
            Text(
              "Brand: WanderFit Luggage",
              style: TextStyles.captionRegular(context)!
                  .copyWith(fontWeight: FontWeight.w600, color: AppColors.grey),
            ),
          ],
        ),
      ),
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
        // _getLocationWithLocationListText(context, item),
        // const SizedBox(
        //   height: 10,
        // ),
        // getSocialMediaAndHobbiesText(context, item),
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
      maxLines: 10,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _getShareViaWhatsappAndLinked(BuildContext context, RecentList item) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _getShareViaWhatsApp(context, item)),
          const SizedBox(
            width: 20,
          ),
          Expanded(child: _getShareViaLinked(context, item)),
        ],
      ),
    );
  }

  Widget _getShareViaWhatsApp(BuildContext context, RecentList item) {
    return InkWell(
      onTap: () {
        showMessage("Share via whatsapp tapped");
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.green.withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Units.kSPadding),
          child: Row(
            children: [
              Image.asset(
                AppIcons.kIcWhatsapp,
                height: 20,
                width: 20,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Share via ",
                style: TextStyles.captionRegular(context)!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              Text(
                "Whatsapp",
                style: TextStyles.captionRegular(context)!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getShareViaLinked(BuildContext context, RecentList list) {
    return InkWell(
      onTap: () {
        showMessage("Share via whatsapp tapped");
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.blueIconColor.withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Units.kSPadding),
          child: Row(
            children: [
              Image.asset(
                AppIcons.kIcInsta,
                height: 20,
                width: 20,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Share via ",
                style: TextStyles.captionRegular(context)!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              Text(
                "LinkedIn",
                style: TextStyles.captionRegular(context)!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getKeyHighLightDetails(BuildContext context, RecentList item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Units.kStandardPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Key Highlighted Details",
            style: TextStyles.buttonSemiBold(context)!
                .copyWith(color: AppColors.grey),
          ),
          _getCategoryAndPlatform(context, item),
          _getLanguageAndLocation(context, item),
          _getRequiredCountnadBudget(context, item),
          _getBrandCollabFollowers(context, item),
        ],
      ),
    );
  }

  Widget _getCategoryAndPlatform(BuildContext context, RecentList item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Units.kStandardPadding),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _getCategory(context, item)),
            const SizedBox(
              width: 10,
            ),
            Expanded(child: _getPlatform(context, item)),
          ],
        ),
      ),
    );
  }

  Widget _getCategory(BuildContext context, RecentList item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Category",
          style: TextStyles.labelRegular(context),
        ),
        const SizedBox(height: 10),
        Text(
          item.categories == "null" ? "LifeStyle,Fashion" : item.categories!,
          style:
              TextStyles.buttonNormal(context)!.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }

  Widget _getPlatform(BuildContext context, RecentList item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Platform",
          style: TextStyles.labelRegular(context),
          maxLines: 4,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          item.categories == "null" ? "LifeStyle,Fashion" : item.categories!,
          style:
              TextStyles.buttonNormal(context)!.copyWith(color: AppColors.grey),
          maxLines: 4,
        ),
      ],
    );
  }

  Widget _getLanguageAndLocation(BuildContext context, RecentList item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Units.kStandardPadding),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _getLanguage(context, item)),
            const SizedBox(
              width: 10,
            ),
            Expanded(child: _getLocation(context, item)),
          ],
        ),
      ),
    );
  }

  Widget _getLanguage(BuildContext context, RecentList item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Language",
          style: TextStyles.labelRegular(context),
          maxLines: 4,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          item.language == "null"
              ? "Hindi, Kannada, Malayalam, Tamil & Telugu"
              : item.language!,
          style:
              TextStyles.buttonNormal(context)!.copyWith(color: AppColors.grey),
          maxLines: 4,
        ),
      ],
    );
  }

  Widget _getLocation(BuildContext context, RecentList item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: TextStyles.labelRegular(context),
          maxLines: 4,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          item.cities == "null"
              ? "Bangalore, Tamilnadu, Kerala & GoaBangalore, Tamilnadu, Kerala & GoaBangalore"
              : item.cities!,
          style:
              TextStyles.buttonNormal(context)!.copyWith(color: AppColors.grey),
          maxLines: 4,
        ),
      ],
    );
  }

  Widget _getRequiredCountnadBudget(BuildContext context, RecentList item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Units.kStandardPadding),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _getRequiredCount(context, item)),
            const SizedBox(
              width: 10,
            ),
            Expanded(child: _getOutBudget(context, item)),
          ],
        ),
      ),
    );
  }

  Widget _getRequiredCount(BuildContext context, RecentList item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Required Count",
          style: TextStyles.labelRegular(context),
          maxLines: 4,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "15-20",
          style:
              TextStyles.buttonNormal(context)!.copyWith(color: AppColors.grey),
          maxLines: 4,
        ),
      ],
    );
  }

  Widget _getOutBudget(BuildContext context, RecentList item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Our budget",
          style: TextStyles.labelRegular(context),
          maxLines: 4,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "₹1,45,000",
          style:
              TextStyles.buttonNormal(context)!.copyWith(color: AppColors.grey),
          maxLines: 4,
        ),
      ],
    );
  }

  Widget _getBrandCollabFollowers(BuildContext context, RecentList item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Units.kStandardPadding),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _getBrand(context, item)),
            const SizedBox(
              width: 10,
            ),
            Expanded(child: _getRequestFollowers(context, item)),
          ],
        ),
      ),
    );
  }

  Widget _getBrand(BuildContext context, RecentList item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Brand Collab with",
          style: TextStyles.labelRegular(context),
          maxLines: 4,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Swiggy",
          style:
              TextStyles.buttonNormal(context)!.copyWith(color: AppColors.grey),
          maxLines: 4,
        ),
      ],
    );
  }

  Widget _getRequestFollowers(BuildContext context, RecentList item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Required followers",
          style: TextStyles.labelRegular(context),
          maxLines: 4,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SvgPicture.asset(
              AppIcons.kInstagram,
              color: AppColors.grey,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "500k -1M+",
              style: TextStyles.buttonNormal(context)!
                  .copyWith(color: AppColors.grey),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SvgPicture.asset(AppIcons.kIcYoutube),
            const SizedBox(
              width: 4,
            ),
            Text(
              "500k -1M+",
              style: TextStyles.buttonNormal(context)!
                  .copyWith(color: AppColors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _getExpiryInformationWithButton(
    BuildContext context,
    RecentList item,
    DetailsState state,
  ) {
    return ColoredBox(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getClockWithExpiryDate(context, state),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Units.kStandardPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _getEditButton(context, state),
                  const SizedBox(width: 15),
                  _getCloseButton(context, state),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _getClockWithExpiryDate(BuildContext context, DetailsState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Units.kXLPadding,
        vertical: Units.kStandardPadding,
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.kIcClockGradient),
          const SizedBox(
            width: 8,
          ),
          Text(
            "Your post has will be expired on 26 July",
            style: TextStyles.labelRegular(context),
          ),
        ],
      ),
    );
  }

  Widget _getEditButton(BuildContext context, DetailsState state) {
    return Expanded(
      child: AppButton(
        onTap: () {
          showMessage("The edit button tapped");
        },
        label: "Edit",
        labelStyle: TextStyles.title2Medium(context)!
            .copyWith(color: AppColors.orangeMenDark),
        color: AppColors.white,
        borderSide: const BorderSide(color: AppColors.orangeMenDark),
        borderRadius: BorderRadius.circular(30),
        height: 50,
      ),
    );
  }

  Widget _getCloseButton(BuildContext context, DetailsState state) {
    return Expanded(
      child: AppButton(
        onTap: () {
          showMessage("The close button tapped");
          Navigator.pop(context);
        },
        height: 50,
        label: "Close",
        labelStyle:
            TextStyles.title2Medium(context)!.copyWith(color: AppColors.white),
        color: AppColors.orangeMenDark,
        borderSide: const BorderSide(color: AppColors.orangeMenDark),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
