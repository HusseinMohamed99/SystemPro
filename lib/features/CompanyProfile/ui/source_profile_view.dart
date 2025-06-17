import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/CompanyProfile/data/model/realestate_source.dart';
import 'package:system_pro/features/CompanyProfile/data/model/source_route_argument.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_cubit.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_state.dart';
import 'package:system_pro/features/CompanyProfile/ui/widgets/get_source_profile_success.dart';

class SourceProfileView extends StatefulWidget {
  const SourceProfileView({super.key, required this.args});
  final SourceRouteArguments args;

  @override
  State<SourceProfileView> createState() => _SourceProfileViewState();
}

class _SourceProfileViewState extends State<SourceProfileView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RealEstateCubit>().getListingsBySource(
        companyId: widget.args.isCompany ? widget.args.id : null,
        marketerId: widget.args.isMarketer ? widget.args.id : null,
        context: context,
      );
    });

    _scrollController.addListener(() {
      final cubit = context.read<RealEstateCubit>();
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          cubit.hasMore &&
          !cubit.isLoading) {
        cubit.loadMoreListingsBySource(lang: context.localeCode);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sourceId = widget.args.id;

    return Scaffold(
      appBar: basicAppBar(),
      body: BlocConsumer<RealEstateCubit, RealEstateState>(
        listener: (context, state) {
          if (state is FilteredListingsError) {
            context.showSnackBar(state.error);
          }
        },
        builder: (context, state) {
          if (state is FilteredListingsError) {
            return Center(
              child: CustomErrorTextWidget(
                errorMessage: context.localization.no_data_found,
                onRetry: () {
                  context.read<RealEstateCubit>().getListingsBySource(
                    companyId: widget.args.isCompany ? widget.args.id : null,
                    marketerId: widget.args.isMarketer ? widget.args.id : null,
                    context: context,
                  );
                },
              ),
            );
          }

          if (state is FilteredListingsSuccess ||
              state is FilteredListingsLoadingMore) {
            final listings =
                state is FilteredListingsSuccess
                    ? state.filteredListings
                    : (state as FilteredListingsLoadingMore).currentListings;

            if (listings.isEmpty) {
              return CustomErrorTextWidget(
                errorMessage: context.localization.no_data_found,
              );
            }

            final firstListing = listings.first;
            final company = firstListing.company;

            // ✅ التحقق حسب نوع المصدر
            final isValidSource =
                (widget.args.isCompany && company?.id == sourceId) ||
                (widget.args.isMarketer && firstListing.marketerId == sourceId);

            if (!isValidSource) {
              return CustomErrorTextWidget(
                errorMessage: context.localization.no_data_found,
              );
            }

            // ✅ تحديد المصدر الحقيقي
            final RealEstateSource? source = company;

            return GetSourceProfileSuccess(
              realEstateSource: source!,
              realEstateSourceListings: listings,
              isCompanyProfile: widget.args.isCompany,
              scrollController: _scrollController,
              isLoadingMore: state is FilteredListingsLoadingMore,
            ).hPadding(kPaddingDefaultHorizontal);
          }

          return const CustomLoader(type: LoaderType.adaptive);
        },
      ),
    );
  }
}
