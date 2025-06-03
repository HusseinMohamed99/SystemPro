import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_cubit.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_state.dart';
import 'package:system_pro/features/CompanyProfile/ui/widgets/get_profile_company_success.dart';

class CompanyProfileView extends StatefulWidget {
  const CompanyProfileView({super.key, required this.companyID});
  final int companyID;

  @override
  State<CompanyProfileView> createState() => _CompanyProfileViewState();
}

class _CompanyProfileViewState extends State<CompanyProfileView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // ✅ تحميل البيانات فقط لو مش متخزنة بالفعل
    final cubit = context.read<RealEstateCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.getListingsBySource(companyId: widget.companyID);
    });

    // ✅ مراقبة السحب لأسفل لعمل loadMore
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
          if (state is FilteredListingsError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is FilteredListingsError) {
            return Center(
              child: CustomErrorTextWidget(
                errorMessage: context.localization.no_data_found,
                onRetry: () {
                  context.read<RealEstateCubit>().getListingsBySource(
                    companyId: widget.companyID,
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

            final company = listings.first.company;
            if (company == null) {
              return CustomErrorTextWidget(
                errorMessage: context.localization.no_data_found,
              );
            }

            return GetProfileCompanySuccess(
              company: company,
              companyListings: listings,
              isCompanyProfile: true,
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
