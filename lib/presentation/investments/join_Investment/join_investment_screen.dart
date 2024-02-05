import 'package:flutter/material.dart';
import 'package:gcib_bank/app_exports.dart';

// ignore: must_be_immutable
class JoinInvestmentScreen extends StatelessWidget {
  JoinInvestmentScreen({Key? key})
      : super(
          key: key,
        );

  bool reivest = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 47.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 341.h,
                margin: EdgeInsets.only(
                  left: 27.h,
                  right: 60.h,
                ),
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
                      "Agile Money Market Fund",
                      style: CustomTextStyles.bodyLargeIndigo800,
                    ),
                    SizedBox(height: 14.v),
                    CustomElevatedButton(
                      width: 121.h,
                      text: "Money Market",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 33.v),
              _buildAboutInvestmentCard(context),
              SizedBox(height: 59.v),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 26.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomElevatedButton(
                        height: 31.v,
                        width: 95.h,
                        text: "Cancel",
                        buttonStyle: CustomButtonStyles.fillBlueGrayTL10,
                        buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                      ),
                      CustomElevatedButton(
                        height: 31.v,
                        width: 113.h,
                        text: "Join",
                        margin: EdgeInsets.only(left: 50.h),
                        buttonStyle: CustomButtonStyles.fillIndigo,
                        buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        color: Colors.black,
        onTap: () {
          Navigator.pushNamed(context, 'home_screen');
        },
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 27.h,
          top: 27.v,
          bottom: 18.v,
        ),
      ),
      title: AppbarTitle(
        text: "Select an Investment",
        margin: EdgeInsets.only(left: 21.h),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildAboutInvestmentCard(BuildContext context) {
    return SizedBox(
      height: 427.adaptSize,
      width: 427.adaptSize,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(vertical: 19.v),
              decoration: AppDecoration.fillIndigo.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL20,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 36.h,
                  vertical: 11.v,
                ),
                decoration: AppDecoration.fillWhiteA.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 3.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5.v),
                            child: Text(
                              "Min Initial Investment",
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.v),
                            child: Text(
                              "5000",
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 13.v),
                    Padding(
                      padding: EdgeInsets.only(right: 6.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 1.v),
                            child: Text(
                              "Min Subsequent Investment",
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                          Text(
                            "1000",
                            style: theme.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 11.v),
                    Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 1.v),
                            child: Text(
                              "Widthrawal charge",
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                          Text(
                            "1%",
                            style: theme.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.v),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(
                left: 1.h,
                top: 141.v,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 5.h,
                vertical: 2.v,
              ),
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 27.h,
                        right: 23.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Type",
                            style: theme.textTheme.titleMedium,
                          ),
                          Spacer(
                            flex: 36,
                          ),
                          Text(
                            "Date",
                            style: theme.textTheme.titleMedium,
                          ),
                          Spacer(
                            flex: 40,
                          ),
                          Text(
                            "Yield",
                            style: theme.textTheme.titleMedium,
                          ),
                          Spacer(
                            flex: 23,
                          ),
                          Text(
                            "Net Yield",
                            style: theme.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.v),
                  Padding(
                    padding: EdgeInsets.only(right: 55.h),
                    child: _buildTableCard(
                      context,
                      dailyYieldText: "Effective Yield",
                      dateText: "10/01/2024",
                      yieldValueText: "1.38",
                      yieldValueText1: "3.38",
                    ),
                  ),
                  SizedBox(height: 7.v),
                  Padding(
                    padding: EdgeInsets.only(right: 55.h),
                    child: _buildTableCard(
                      context,
                      dailyYieldText: "Daily Yield",
                      dateText: "10/01/2024",
                      yieldValueText: "1.38",
                      yieldValueText1: "3.32",
                    ),
                  ),
                  SizedBox(height: 26.v),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 10.v,
              ),
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 233.h,
                      margin: EdgeInsets.only(left: 62.h),
                      child: Text(
                        "Pleas specify how your income\n should be distributed",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  SizedBox(height: 19.v),
                  SizedBox(
                    height: 28.v,
                    width: 367.h,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomCheckboxButton(
                            alignment: Alignment.topLeft,
                            text: "Reivest",
                            value: reivest,
                            padding: EdgeInsets.symmetric(vertical: 1.v),
                            onChange: (value) {
                              reivest = value;
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Interest earned will be reinvested back to the fund",
                            style: CustomTextStyles.bodyMediumIndigo800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Padding(
                    padding: EdgeInsets.only(left: 35.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          margin: EdgeInsets.only(
                            top: 4.v,
                            bottom: 3.v,
                          ),
                          decoration: BoxDecoration(
                            color: appTheme.whiteA700,
                            borderRadius: BorderRadius.circular(
                              5.h,
                            ),
                            border: Border.all(
                              color: appTheme.indigo800,
                              width: 1.h,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Redeem",
                                  style: theme.textTheme.titleSmall,
                                ),
                                Text(
                                  "Interest earned will be sent to your bank or MPESA",
                                  style: CustomTextStyles.bodyMediumIndigo800,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.v),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildTableCard(
    BuildContext context, {
    required String dailyYieldText,
    required String dateText,
    required String yieldValueText,
    required String yieldValueText1,
  }) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 4.v),
          child: Text(
            dailyYieldText,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        Spacer(
          flex: 34,
        ),
        Padding(
          padding: EdgeInsets.only(top: 3.v),
          child: Text(
            dateText,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        Spacer(
          flex: 30,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 4.v),
          child: Text(
            yieldValueText,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        Spacer(
          flex: 35,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 4.v),
          child: Text(
            yieldValueText1,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
      ],
    );
  }
}
