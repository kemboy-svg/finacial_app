class Investment {
  final String fund_No, fund_Name;
  final dynamic units_Purchased,
      units_Redeemed,
      total_Units,
      fund_Balance,
      nav,
      todayBidPrice,
      todayOfferPrice,
      daily_Income,
      fund_Type,
      dividend_Mandate;

  Investment({
    required this.fund_Type,
    required this.fund_No,
    required this.dividend_Mandate,
    required this.fund_Name,
    required this.units_Purchased,
    required this.units_Redeemed,
    required this.total_Units,
    required this.fund_Balance,
    required this.nav,
    required this.todayBidPrice,
    required this.todayOfferPrice,
    required this.daily_Income,
  });

  Investment.fromJson(Map<String, dynamic> json)
      : fund_Type = json['fund_Type'] ?? 0,
        fund_No = json['fund_No'] ?? 'N/A',
        dividend_Mandate = json['dividend_Mandate'] ?? 0,
        fund_Name = json['fund_Name'] ?? 'N/A',
        units_Purchased = json['units_Purchased'] ?? 0,
        units_Redeemed = json['units_Redeemed'] ?? 0,
        total_Units = json['total_Units'] ?? 0,
        fund_Balance = json['fund_Balance'] ?? 0,
        nav = json['nav'] ?? 0,
        todayBidPrice = json['todayBidPrice'] ?? 0,
        todayOfferPrice = json['todayOfferPrice'] ?? 0,
        daily_Income = json['daily_Income'] ?? 0;
}