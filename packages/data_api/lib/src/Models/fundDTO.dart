class Fund {
  final String no, name, bankAccNo, narration, img;
  final dynamic redemptionCharge, type, initAmount, subSeqAmount, minRedAmnt;

  /// had to make redemptionCharge dynamic because sometimes it
  /// can be 1.5 & other times 5

  Fund({
    required this.no,
    required this.name,
    required this.bankAccNo,
    required this.narration,
    required this.img,
    required this.initAmount,
    required this.subSeqAmount,
    required this.type,
    required this.redemptionCharge,
    required this.minRedAmnt,
  });

  Fund.fromJson(Map<String, dynamic> json)
      : no = json['no'] ?? 'N/A',
        name = json['name'] ?? 'N/A',
        bankAccNo = json['bankAccNo'] ?? 'N/A',
        narration = json['narration'] ?? '',
        img = json['img'] ?? 'N/A',
        initAmount = json['initAmount'] ?? 0,
        subSeqAmount = json['subSeqAmount'] ?? 0,
        type = json['type'] ?? 0,
        redemptionCharge = json['redemptionCharge'] ?? 0,
        minRedAmnt = json['minRedAmnt'] ?? 0;
}