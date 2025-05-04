import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';
import 'package:system_pro/features/Home/ui/home_widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarketplaceCubit, MarketplaceState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return const Scaffold(body: SafeArea(child: HomeViewBody()));
      },
    );
  }
}
