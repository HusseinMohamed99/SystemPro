import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/functions/time_ago.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/images/image_with_dotted_border.dart';
import 'package:system_pro/features/CompanyProfile/data/model/source_route_argument.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';

/// Widget that shows the listing creation time and clickable company/marketer logo.
class CompanyLogoAndCreatedTimeWidget extends StatelessWidget {
  const CompanyLogoAndCreatedTimeWidget({super.key, required this.listing});

  final Listing listing;

  bool _isSamePage(BuildContext context, int id, String type) {
    final route = ModalRoute.of(context);
    final currentRoute = route?.settings.name;
    final currentArgs = route?.settings.arguments;

    return currentRoute == Routes.sourceProfileView &&
        currentArgs is SourceRouteArguments &&
        currentArgs.id == id &&
        currentArgs.type == type;
  }

  @override
  Widget build(BuildContext context) {
    final bool isCompany =
        listing.companyId != null && listing.marketerId == null;

    final int? id = isCompany ? listing.companyId : listing.marketerId;
    final String type = isCompany ? 'company' : 'marketer';
    final String? imageUrl = listing.company?.pictureUrl;

    return Row(
      children: [
        // ⏱️ زمن النشر بصيغة "منذ ..."
        Text(
          TimeAgoHelper.timeAgo(context, listing.createdAt ?? ''),
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.regular,
            color: customSoftAndHintGreyColor(context),
          ),
        ),
        const Spacer(),

        // 🏢 صورة الشعار لو البيانات متوفرة
        if (id != null )
          GestureDetector(
            onTap: () {
              if (!_isSamePage(context, id, type)) {
                context.pushNamed(
                  Routes.sourceProfileView,
                  arguments: SourceRouteArguments(id: id, type: type),
                );
              }
            },
            child: ImageWithDottedBorder(imageUrl: imageUrl),
          ),
      ],
    );
  }
}
