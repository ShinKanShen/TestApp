class Data {
  String stockId;
  String symbol;
  String fullName;
  double change;
  double changePercent;
  String exchane;
  int totalTrading;
  double closePrice;
  Data({
    required this.stockId,
    required this.symbol,
    required this.fullName,
    required this.change,
    required this.changePercent,
    required this.exchane,
    required this.totalTrading,
    required this.closePrice,
  });

  factory Data.fromJson(Map<String, dynamic> json)=> Data(
    stockId: json['StockId'], symbol: json['symbol'], 
    fullName: json['FullName'], change: json['change'],
     changePercent: json['changePercent'], exchane: json['exchange'],
      totalTrading: json['totalTrading'], closePrice: json['closePrice']);

  Map<String, dynamic> toJson()=>{
    'StockId': stockId,
    'symbol': symbol,
    'FullName': fullName,
    'change': change,
    'changePercent': changePercent,
    'exchange': exchane,
    'totalTrading': totalTrading,
    'closePrice': closePrice,

  };

}

class ChungKhoan{
  List<Data> datas;
  ChungKhoan({
    required this.datas
  });

  factory ChungKhoan.fromJson(Map<String, dynamic> json)=> ChungKhoan(
    datas: List<dynamic>.from(json['d']).map((e) => Data.fromJson(e)).toList()
    );

  Map<String, dynamic> toJson() => {
    'd': datas
  };
}