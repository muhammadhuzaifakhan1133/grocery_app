import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/ui/filters/filters_view_model.dart';
import 'package:grocery_app/ui/filters/widget/circle_tick_filters.dart';
import 'package:grocery_app/ui/filters/widget/filter_widgets.dart';
import 'package:grocery_app/ui/filters/widget/star_rating_filter_field.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

class FiltersView extends StatelessWidget {
  const FiltersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        title: "Apply Filters",
        context: context,
        actions: [
          IconButton(
            onPressed: () {
              context.read<FiltersViewModel>().clearFilters();
            },
            icon: Icon(Icons.restart_alt_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 17),
        child: Card(
          color: AppColors.whiteColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 15),
                FiltersWidgets.priceRangeFields(
                  minPriceController: TextEditingController(),
                  maxPriceController: TextEditingController(),
                ),
                const SizedBox(height: 24),
                Divider(),
                const SizedBox(height: 19),
                StarRatingFilterField(),
                const SizedBox(height: 28),
                Divider(),
                const SizedBox(height: 19),
                CircleTickFilters(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
