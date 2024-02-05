import 'package:data_api/data_api.dart';
import 'package:flutter/material.dart';
import 'package:gcib_bank/app_exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gcib_bank/shared_blocs/myinv/bloc/myinv_bloc.dart';
import 'widgets/holdingscard_item_widget.dart';


// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key})
      : super(
          key: key,
        );

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => HomeScreen());
  }

  TextEditingController searchController = TextEditingController();

  TextEditingController timeController = TextEditingController();

  TextEditingController timeController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray200,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 8.v),
              _buildAppBar(context),
              SizedBox(height: 19.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildMyHoldings(context),
                        SizedBox(height: 15.v),
                        _buildTransaction(context),
                        SizedBox(height: 10.v),
                        Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Text(
                            "Pending Redemptions",
                            style: CustomTextStyles.titleLargeIndigo800SemiBold,
                          ),
                        ),
                        SizedBox(height: 6.v),
                        SizedBox(
                          width: 84.h,
                          child: Divider(
                            color: appTheme.yellowA700,
                            indent: 7.h,
                          ),
                        ),
                        SizedBox(height: 14.v),
                        _buildPending(context),
                        SizedBox(height: 11.v),
                        Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Text(
                            "Pending Contributions",
                            style: CustomTextStyles.titleLargeIndigo800SemiBold,
                          ),
                        ),
                        SizedBox(height: 7.v),
                        SizedBox(
                          width: 83.h,
                          child: Divider(
                            color: appTheme.yellowA700,
                            indent: 6.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildInvestNow(BuildContext context) {
    return CustomElevatedButton(
      width: 111.h,
      text: "Invest Now",
      buttonStyle: CustomButtonStyles.fillBlueGray,
      buttonTextStyle: CustomTextStyles.titleMediumGray900,
      onPressed: (){
           Navigator.pushNamed(context, 'list_investments');
      }
    );
  }

  /// Section Widget
  Widget _buildViewHoldings(BuildContext context) {
    return CustomElevatedButton(
      width: 122.h,
      text: "View Holdings",
      buttonStyle: CustomButtonStyles.fillBlueGray,
      buttonTextStyle: CustomTextStyles.titleMediumIndigo800_1,
    );
  }

  /// Section Widget
  Widget _buildAppBar(BuildContext context) {
    return Container(
      width: 411.h,
      margin: EdgeInsets.symmetric(horizontal: 8.h),
      padding: EdgeInsets.symmetric(vertical: 6.v),
      decoration: AppDecoration.fillIndigo8001.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBar(
            leadingWidth: 51.h,
            leading: AppbarLeadingCircleimage(
              color: Colors.white,
              imagePath: ImageConstant.imgMegaphone,
              margin: EdgeInsets.only(
                left: 30.h,
                top: 14.v,
                bottom: 12.v,
                
              ),
            ),
            centerTitle: true,
            title: AppbarSubtitle(
              text: "Overview",
              margin: EdgeInsets.only(top: 20.v),
            ),
            actions: [
              AppbarTrailingCircleimage(
                imagePath: ImageConstant.imgEllipse9,
                margin: EdgeInsets.only(
                  left: 33.h,
                  right: 33.h,
                  bottom: 5.v,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(
              left: 55.h,
              right: 52.h,
            ),
            child: CustomSearchView(
              controller: searchController,
              hintText: "search something",
            ),
          ),
          SizedBox(height: 19.v),
          Container(
            width: 346.h,
            margin: EdgeInsets.symmetric(horizontal: 32.h),
            padding: EdgeInsets.symmetric(
              horizontal: 32.h,
              vertical: 13.v,
            ),
            decoration: AppDecoration.fillWhiteAD.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 77.h),
                  child: Row(
                    children: [
                      Container(
                        height: 28.v,
                        width: 31.h,
                        margin: EdgeInsets.only(bottom: 1.v),
                        decoration: BoxDecoration(
                          color: appTheme.whiteA70042,
                          borderRadius: BorderRadius.circular(
                            10.h,
                          ),
                          border: Border.all(
                            color: appTheme.yellow600Ea,
                            width: 5.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18.h),
                        child: Text(
                          "Total Balance ",
                          style: CustomTextStyles.headlineSmallIndigo800,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 13.v),
                Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Row(
                    children: [
                      Text(
                        "KES 80,000.00",
                        style: CustomTextStyles.titleLargeIndigo800,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgEye,
                        height: 20.v,
                        width: 25.h,
                        margin: EdgeInsets.only(
                          left: 12.h,
                          bottom: 3.v,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3.v),
              ],
            ),
          ),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInvestNow(context),
                _buildViewHoldings(context),
              ],
            ),
          ),
          SizedBox(height: 10.v),
        ],
      ),
    );
  }

  /// MyHoldings Widget
  Widget _buildMyHoldings(BuildContext context) {
    context.read<MyInvBloc>().add(MyInvFetch());
    return Padding(
      padding: EdgeInsets.only(right: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Text(
              "My Holdings ",
              style: CustomTextStyles.titleLargeIndigo800SemiBold,
            ),
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              right: 29.h,
            ),
            child: BlocBuilder<MyInvBloc, MyInvState>(
              builder: (context, state) {
                if (state.status == MyInvStatus.success) {
                  if (state.investments.length > 0) {
                    return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (
                        context,
                        index,
                      ) {
                        return SizedBox(
                          height: 18.v,
                        );
                      },
                      itemCount: state.investments.length,
                      itemBuilder: (context, index) {
                        Investment env = state.investments[index];

                        return HoldingscardItemWidget(
                          fundname: env.fund_Name,
                          fundBal: env.fund_Balance,
                          fundType: env.fund_Type,
                        );
                      },
                    );
                  } else {
                    return Container(
                      child: Text('Your Investments will be displayed here'),
                    );
                  }
                }

                return Container(
                  width: 160.0,
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Center(
                    child: Text(
                      'Your investments will be displayed here',
                      style:
                          TextStyle(fontSize: 18.0, color: appTheme.indigo800),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 11.v),
          Padding(
            padding: EdgeInsets.only(right: 15.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recent Transactions ",
                  style: CustomTextStyles.titleLargeIndigo800SemiBold,
                ),
                Spacer(),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "View All Transactions",
                          style: CustomTextStyles.bodyMediumIndigo800,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 140.h,
                        child: Divider(
                          color: appTheme.indigo800,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTime(BuildContext context) {
    return CustomTextFormField(
      controller: timeController,
      hintText: "12 Dec, 12:30 PM",
      hintStyle: theme.textTheme.bodyLarge!,
      alignment: Alignment.centerRight,
      contentPadding: EdgeInsets.symmetric(horizontal: 1.h),
      borderDecoration: TextFormFieldStyleHelper.underLineDeepOrange,
      filled: false,
    );
  }

  /// Section Widget
  Widget _buildTime1(BuildContext context) {
    return CustomTextFormField(
      controller: timeController1,
      hintText: "12 Dec, 04:30 PM",
      hintStyle: theme.textTheme.bodyLarge!,
      textInputAction: TextInputAction.done,
      contentPadding: EdgeInsets.symmetric(horizontal: 2.h),
      borderDecoration: TextFormFieldStyleHelper.underLineDeepOrange,
      filled: false,
    );
  }

  /// Section Widget
  Widget _buildTransaction(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 9.h),
      padding: EdgeInsets.symmetric(
        horizontal: 6.h,
        vertical: 22.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 5.v),
          SizedBox(
            height: 53.v,
            width: 341.h,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.v),
                    child: Text(
                      "+10,000  KES",
                      style: CustomTextStyles.bodyLargeGreen500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 11.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contribution",
                          style: theme.textTheme.titleLarge,
                        ),
                        _buildTime(context),
                        Divider(
                          color: appTheme.deepOrange50,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.v),
          SizedBox(
            height: 53.v,
            width: 341.h,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.v),
                    child: Text(
                      "-3,300  KES",
                      style: CustomTextStyles.bodyLargeRed900,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 11.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Withdrawal",
                          style: theme.textTheme.titleLarge,
                        ),
                        _buildTime1(context),
                        Divider(
                          color: appTheme.deepOrange50,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.only(left: 17.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mobile Service",
                      style: theme.textTheme.titleLarge,
                    ),
                    Text(
                      "12 Dec, 12:30 PM",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.v,
                    bottom: 15.v,
                  ),
                  child: Text(
                    "+4,500  KES",
                    style: CustomTextStyles.bodyLargeGreen500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPending(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 9.h),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 23.h,
              vertical: 3.v,
            ),
            decoration: AppDecoration.fillBlueGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 18.v),
                  child: Text(
                    "Fund",
                    style: CustomTextStyles.titleMediumBlack900_1,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 18.v),
                  child: Text(
                    "Amount",
                    style: CustomTextStyles.titleMediumBlack900_1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 27.h,
                    bottom: 18.v,
                  ),
                  child: Text(
                    "Price/share",
                    style: CustomTextStyles.titleMediumBlack900_1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.h,
                    right: 8.h,
                    bottom: 18.v,
                  ),
                  child: Text(
                    "Date",
                    style: CustomTextStyles.titleMediumBlack900_1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.v),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              right: 6.h,
            ),
            child: _buildPendingR(
              context,
              agileFixedIncome: "Agile fixed\nincome fund",
              price: "KES \n20,000.00\n",
              price1: "KES  1.00",
              date: "2024-01-11",
            ),
          ),
          Divider(
            color: appTheme.deepOrange50,
            indent: 21.h,
            endIndent: 19.h,
          ),
          SizedBox(height: 10.v),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              right: 6.h,
            ),
            child: _buildPendingR(
              context,
              agileFixedIncome: "Agile money\nmarket fund",
              price: "KES \n3,400.00\n",
              price1: "KES  1.00",
              date: "2024-01-11",
            ),
          ),
          SizedBox(height: 19.v),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildPendingR(
    BuildContext context, {
    required String agileFixedIncome,
    required String price,
    required String price1,
    required String date,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 86.h,
          margin: EdgeInsets.only(bottom: 10.v),
          child: Text(
            agileFixedIncome,
            maxLines: null,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        Container(
          width: 72.h,
          margin: EdgeInsets.only(
            left: 10.h,
            top: 8.v,
          ),
          child: Text(
            price,
            maxLines: null,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20.h,
            top: 17.v,
            bottom: 10.v,
          ),
          child: Text(
            price1,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 14.h,
            top: 17.v,
            bottom: 10.v,
          ),
          child: Text(
            date,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
      ],
    );
  }
}
