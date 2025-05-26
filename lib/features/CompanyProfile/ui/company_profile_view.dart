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

class CompanyProfileView extends StatelessWidget {
  const CompanyProfileView({super.key, required this.companyID});
  final int companyID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(),
      body: BlocBuilder<RealEstateCubit, RealEstateState>(
        builder: (context, state) {
          if (state is FilteredListingsError) {
            return CustomErrorWidget(errorMessage: state.error);
          }
          if (state is FilteredListingsSuccess) {
            final listings = state.filteredListings;
            final companyListings =
                listings.where((l) => l.company?.id == companyID).toList();
            if (companyListings.isEmpty ||
                companyListings.first.company == null) {
              return CustomErrorWidget(
                errorMessage: context.localization.no_data_found,
              );
            }
            final company = companyListings.first.company!;
            return GetProfileCompanySuccess(
              company: company,
              companyListings: companyListings,
            ).hPadding(kPaddingDefaultHorizontal);
          }
          return const AdaptiveIndicator();
        },
      ),
    );
  }
}