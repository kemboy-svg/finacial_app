import 'package:data_api/data_api.dart';
import 'package:flutter/material.dart';
import 'package:gcib_bank/app_exports.dart';
import 'package:gcib_bank/core/utils/spinner.dart';
import 'package:gcib_bank/presentation/investments/widgets/investmentcard_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/allinv_bloc.dart';

class ListInvestmentsScreen extends StatelessWidget {
  ListInvestmentsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    context.read<AllInvBloc>().add(AllInvFetch());
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.only(
            left: 27.h,
            top: 47.v,
            right: 60.h,
          ),
          child:
              BlocBuilder<AllInvBloc, AllInvState>(builder: (context, state) {
            if (state.status == AllInvStatus.loading) {
              return Center(
                  child: LoadingSpinner(color: appTheme.blueGray400));
            }
            if (state.status == AllInvStatus.success) {
              return ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (
                  context,
                  index,
                ) {
                  return SizedBox(
                    height: 31.v,
                  );
                },
                itemCount: state.allinvestments.length,
                itemBuilder: (context, index) {
                  Fund fund = state.allinvestments[index];
                  return InvestmentcardItemWidget(
                      fundname: fund.name, fundtype: fund.type);
                },
              );
            }
            if (state.status == AllInvStatus.failure) {
              return Text(
                  "Some error occurred while loading the investments");
            }
            return Container();
          }),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
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
}
