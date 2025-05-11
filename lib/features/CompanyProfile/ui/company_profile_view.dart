import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_cubit.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_state.dart';
import 'package:system_pro/features/CompanyProfile/ui/widgets/about_real_estate_widget.dart';
import 'package:system_pro/features/CompanyProfile/ui/widgets/get_profile_company_success.dart';
import 'package:system_pro/features/CompanyProfile/ui/widgets/location_widget.dart';
import 'package:system_pro/features/CompanyProfile/ui/widgets/properties_widget.dart';
import 'package:system_pro/features/Home/data/model/company.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';

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

