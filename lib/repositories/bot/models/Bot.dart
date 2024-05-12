import 'package:flutter/foundation.dart';

enum ExchangeType { Binance, Coinbase, Kraken }

enum SymbolType { BTC_USDT, ETH_USDT }

enum BotStatusType { Active, Inactive, Suspended }

class BotEntity {
  final String id;
  final String name;
  final ExchangeType exchange;
  final SymbolType symbol;
  final double amount;
  // final double gridLength;
  // final double firstOrderOffset;
  // final int numOrders;
  // final int partialNumOrders;
  // final double nextOrderVolume;
  // final double profitPercentage;
  // final double priceChangePercentage;
  // final double logCoefficient;
  // final double profitCapitalization;
  // final double upperPriceLimit;
  final BotStatusType status;
  final bool isActive;
  // final String userId;
  // final String exchangeKeyId;
  final DateTime createdAt;
  // final DateTime updatedAt;

  BotEntity({
    required this.id,
    required this.name,
    required this.exchange,
    required this.symbol,
    required this.amount,
    // required this.gridLength,
    // required this.firstOrderOffset,
    // required this.numOrders,
    // required this.partialNumOrders,
    // required this.nextOrderVolume,
    // required this.profitPercentage,
    // required this.priceChangePercentage,
    // required this.logCoefficient,
    // required this.profitCapitalization,
    // required this.upperPriceLimit,
    required this.status,
    required this.isActive,
    // required this.userId,
    // required this.exchangeKeyId,
    required this.createdAt,
    // required this.updatedAt,
  });

  factory BotEntity.fromJson(Map<String, dynamic> json) {
    return BotEntity(
      id: json['id'],
      name: json['name'],
      exchange: ExchangeType.values.byName(json['exchange']),
      symbol: SymbolType.values.byName(json['symbol']),
      amount: json['amount'].toDouble(),
      // gridLength: json['grid_length'].toDouble(),
      // firstOrderOffset: json['first_order_offset'].toDouble(),
      // numOrders: json['num_orders'],
      // partialNumOrders: json['partial_num_orders'],
      // nextOrderVolume: json['next_order_volume'].toDouble(),
      // profitPercentage: json['profit_percentage'].toDouble(),
      // priceChangePercentage: json['price_change_percentage'].toDouble(),
      // logCoefficient: json['log_coefficient'].toDouble(),
      // profitCapitalization: json['profit_capitalization'].toDouble(),
      // upperPriceLimit: json['upper_price_limit'].toDouble(),
      status: BotStatusType.values.byName(json['status']),
      isActive: json['is_active'],
      // userId: json['user_id'],
      // exchangeKeyId: json['exchange_key_id'],
      createdAt: DateTime.parse(json['created_at']),
      // updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'exchange': describeEnum(exchange),
        'symbol': describeEnum(symbol),
        'amount': amount,
        // 'grid_length': gridLength,
        // 'first_order_offset': firstOrderOffset,
        // 'num_orders': numOrders,
        // 'partial_num_orders': partialNumOrders,
        // 'next_order_volume': nextOrderVolume,
        // 'profit_percentage': profitPercentage,
        // 'price_change_percentage': priceChangePercentage,
        // 'log_coefficient': logCoefficient,
        // 'profit_capitalization': profitCapitalization,
        // 'upper_price_limit': upperPriceLimit,
        'status': describeEnum(status),
        'is_active': isActive,
        // 'user_id': userId,
        // 'exchange_key_id': exchangeKeyId,
        'created_at': createdAt.toIso8601String(),
        // 'updated_at': updatedAt.toIso8601String(),
      };
}
