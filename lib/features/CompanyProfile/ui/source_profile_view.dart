import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/CompanyProfile/data/model/realestate_source.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_cubit.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_state.dart';
import 'package:system_pro/features/CompanyProfile/ui/widgets/get_source_profile_success.dart';

/// Screen to display either a company or marketer profile with their listings
class SourceProfileView extends StatefulWidget {
  const SourceProfileView({super.key, this.companyId, this.marketerId})
    : assert(companyId != null || marketerId != null);

  /// Optional company ID (only one of companyId or marketerId must be passed)
  final int? companyId;

  /// Optional marketer ID (only one of companyId or marketerId must be passed)
  final int? marketerId;

  @override
  State<SourceProfileView> createState() => _SourceProfileViewState();
}

class _SourceProfileViewState extends State<SourceProfileView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Trigger data load after first build frame
    final cubit = context.read<RealEstateCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.getListingsBySource(
        companyId: widget.companyId,
        marketerId: widget.marketerId,
      );
    });

    // Scroll listener for loading more listings when near the bottom
    _scrollController.addListener(() {
      final cubit = context.read<RealEstateCubit>();
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          cubit.hasMore &&
          !cubit.isLoading) {
        cubit.loadMoreListingsBySource();
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
    return Scaffold(
      appBar: basicAppBar(),
      body: BlocConsumer<RealEstateCubit, RealEstateState>(
        listener: (context, state) {
          // Display error messages as snackbars
          if (state is FilteredListingsError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          // Handle error UI
          if (state is FilteredListingsError) {
            return Center(
              child: CustomErrorTextWidget(
                errorMessage: context.localization.no_data_found,
                onRetry: () {
                  context.read<RealEstateCubit>().getListingsBySource(
                    companyId: widget.companyId,
                    marketerId: widget.marketerId,
                  );
                },
              ),
            );
          }

          // Handle success or paginated loading
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

            // Extract current source based on listing (company or marketer)
            final sourceId = widget.companyId ?? widget.marketerId;
            final company = listings.first.company;
            final marketer = listings.first.marketer;

            final isValidSource =
                (company?.id == sourceId) || (marketer?.id == sourceId);

            if (!isValidSource) {
              return CustomErrorTextWidget(
                errorMessage: context.localization.no_data_found,
              );
            }

       final source = (company ?? marketer) as RealEstateSource;

return GetSourceProfileSuccess(
  realEstateSource: source,
  realEstateSourceListings: listings,
  isCompanyProfile: widget.companyId != null,
  scrollController: _scrollController,
  isLoadingMore: state is FilteredListingsLoadingMore,
).hPadding(kPaddingDefaultHorizontal);
          }

          // Show loader during initial fetch
          return const CustomLoader(type: LoaderType.adaptive);
        },
      ),
    );
  }
}
