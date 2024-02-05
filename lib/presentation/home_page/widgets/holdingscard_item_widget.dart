import 'package:flutter/material.dart';
import '../../../app_exports.dart';

// ignore: must_be_immutable
class HoldingscardItemWidget extends StatelessWidget {
  final String fundname;
  final int fundBal;
  final int fundType;

   HoldingscardItemWidget({
    Key? key,
    required this.fundname, 
    required this.fundBal,
    required this.fundType,
  }) : super(
          key: key,
        );

     

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 4.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              fundname,
              style: CustomTextStyles.bodyLargeIndigo800_2,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              fundBal.toStringAsFixed(2),
              style: CustomTextStyles.titleMediumIndigo800,
            ),
          ),
          SizedBox(height: 4.v),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              getFundTypeText(fundType),
              style: CustomTextStyles.bodyLargeIndigo800_1,
            ),
          ),
        ],
      ),
    );
  }
}
