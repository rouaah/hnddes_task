import 'package:flutter/material.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/order_components/cost_detail_row.dart';

class OrderCostDetailsCard extends StatelessWidget {
  const OrderCostDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          costNameRow(costName: 'order_details.sub_total'.tr(context), costDetail: '200.00 IQD'),
          costNameRow(costName: 'order_details.tax'.tr(context), costDetail: '24.00 IQD'),
          costNameRow(costName: 'order_details.discount'.tr(context), costDetail: '-24.00 IQD'),
          Divider(
            indent: 20,
            endIndent: 20,
            thickness: 2,
          ),
          costNameRow(costName: 'common.total'.tr(context), costDetail: '224 IQD'),
        ],
      ),
      );
  }
}
