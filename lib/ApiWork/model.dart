// To parse this JSON data, do
//
//     final model = modelFromMap(jsonString);

import 'dart:convert';

List<Model> modelFromMap(String str) => List<Model>.from(json.decode(str).map((x) => Model.fromMap(x)));

String modelToMap(List<Model> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Model {
    Model({
        required this.id,
        required this.name,
        required this.symbol,
        required this.rank,
        required this.circulatingSupply,
        required this.totalSupply,
        required this.maxSupply,
        required this.betaValue,
        required this.firstDataAt,
        required this.lastUpdated,
        required this.quotes,
    });

    String id;
    String name;
    String symbol;
    int rank;
    double circulatingSupply;
    double totalSupply;
    double maxSupply;
    double betaValue;
    DateTime firstDataAt;
    DateTime lastUpdated;
    Quotes quotes;

    factory Model.fromMap(Map<String, dynamic> json) => Model(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        rank: json["rank"],
        circulatingSupply: json["circulating_supply"]?.toDouble(),
        totalSupply: json["total_supply"]?.toDouble(),
        maxSupply: json["max_supply"]?.toDouble(),
        betaValue: json["beta_value"]?.toDouble(),
        firstDataAt: DateTime.parse(json["first_data_at"]),
        lastUpdated: DateTime.parse(json["last_updated"]),
        quotes: Quotes.fromMap(json["quotes"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "rank": rank,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        "beta_value": betaValue,
        "first_data_at": firstDataAt.toIso8601String(),
        "last_updated": lastUpdated.toIso8601String(),
        "quotes": quotes.toMap(),
    };
}

class Quotes {
    Quotes({
        required this.usd,
    });

    Usd usd;

    factory Quotes.fromMap(Map<String, dynamic> json) => Quotes(
        usd: Usd.fromMap(json["USD"]),
    );

    Map<String, dynamic> toMap() => {
        "USD": usd.toMap(),
    };
}

class Usd {
    Usd({
        required this.price,
        required this.volume24H,
        required this.volume24HChange24H,
        required this.marketCap,
        required this.marketCapChange24H,
        required this.percentChange15M,
        required this.percentChange30M,
        required this.percentChange1H,
        required this.percentChange6H,
        required this.percentChange12H,
        required this.percentChange24H,
        required this.percentChange7D,
        required this.percentChange30D,
        required this.percentChange1Y,
        required this.athPrice,
        required this.athDate,
        required this.percentFromPriceAth,
    });

    double price;
    double volume24H;
    double volume24HChange24H;
    int marketCap;
    double marketCapChange24H;
    double percentChange15M;
    double percentChange30M;
    double percentChange1H;
    double percentChange6H;
    double percentChange12H;
    double percentChange24H;
    double percentChange7D;
    double percentChange30D;
    double percentChange1Y;
    double athPrice;
    DateTime athDate;
    double percentFromPriceAth;

    factory Usd.fromMap(Map<String, dynamic> json) => Usd(
        price: json["price"]?.toDouble(),
        volume24H: json["volume_24h"]?.toDouble(),
        volume24HChange24H: json["volume_24h_change_24h"]?.toDouble(),
        marketCap: json["market_cap"],
        marketCapChange24H: json["market_cap_change_24h"]?.toDouble(),
        percentChange15M: json["percent_change_15m"]?.toDouble(),
        percentChange30M: json["percent_change_30m"]?.toDouble(),
        percentChange1H: json["percent_change_1h"]?.toDouble(),
        percentChange6H: json["percent_change_6h"]?.toDouble(),
        percentChange12H: json["percent_change_12h"]?.toDouble(),
        percentChange24H: json["percent_change_24h"]?.toDouble(),
        percentChange7D: json["percent_change_7d"]?.toDouble(),
        percentChange30D: json["percent_change_30d"]?.toDouble(),
        percentChange1Y: json["percent_change_1y"]?.toDouble(),
        athPrice: json["ath_price"]?.toDouble(),
        athDate: DateTime.parse(json["ath_date"]),
        percentFromPriceAth: json["percent_from_price_ath"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "price": price,
        "volume_24h": volume24H,
        "volume_24h_change_24h": volume24HChange24H,
        "market_cap": marketCap,
        "market_cap_change_24h": marketCapChange24H,
        "percent_change_15m": percentChange15M,
        "percent_change_30m": percentChange30M,
        "percent_change_1h": percentChange1H,
        "percent_change_6h": percentChange6H,
        "percent_change_12h": percentChange12H,
        "percent_change_24h": percentChange24H,
        "percent_change_7d": percentChange7D,
        "percent_change_30d": percentChange30D,
        "percent_change_1y": percentChange1Y,
        "ath_price": athPrice,
        "ath_date": athDate.toIso8601String(),
        "percent_from_price_ath": percentFromPriceAth,
    };
}
