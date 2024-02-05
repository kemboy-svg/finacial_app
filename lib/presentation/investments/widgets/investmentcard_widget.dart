import 'package:flutter/material.dart';
import 'package:gcib_bank/app_exports.dart';


// ignore: must_be_immutable
class InvestmentcardItemWidget extends StatelessWidget {
  final String fundname;
  final int fundtype;
  const InvestmentcardItemWidget({Key? key,
   required this.fundname,
  required this.fundtype
    })
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.pushNamed(context, 'join_investments');
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 14.v,
        ),
        decoration: AppDecoration.fillBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             fundname,
              style: CustomTextStyles.bodyLargeIndigo800,
            ),
            SizedBox(height: 13.v),
            CustomElevatedButton(
              width: 121.h,
              text: getFundTypeText(fundtype)
            ),
          ],
        ),
      ),

    );
  }
}
