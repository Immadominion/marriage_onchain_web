class UserModel {
  final Wallet? wallet;

  UserModel({this.wallet});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      wallet: json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (wallet != null) {
      data['wallet'] = wallet!.toJson();
    }
    return data;
  }
}

class Wallet {
  final String address;

  Wallet({required this.address});

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(address: json['address'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'address': address};
  }
}
