class ShareDataModel {
  final String firstPartnerName;
  final String secondPartnerName;
  final int nftId;
  final String createdDate;
  
  ShareDataModel({
    required this.firstPartnerName,
    required this.secondPartnerName,
    required this.nftId,
    required this.createdDate,
  });
  
  factory ShareDataModel.fromJson(Map<String, dynamic> json) {
    return ShareDataModel(
      firstPartnerName: json['firstPartnerName'] ?? '',
      secondPartnerName: json['secondPartnerName'] ?? '',
      nftId: json['nftId'] ?? 0,
      createdDate: json['createdDate'] ?? '',
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'firstPartnerName': firstPartnerName,
      'secondPartnerName': secondPartnerName,
      'nftId': nftId,
      'createdDate': createdDate,
    };
  }
}