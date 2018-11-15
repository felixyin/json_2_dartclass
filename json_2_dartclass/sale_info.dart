import 'list_price.dart';
import 'retail_price.dart';
import 'offers.dart';

class SaleInfo {
  String country;
  String saleability;
  bool isEbook;
  ListPrice listPrice;
  RetailPrice retailPrice;
  String buyLink;
  List<Offers> offers;

  SaleInfo(
      {this.country,
      this.saleability,
      this.isEbook,
      this.listPrice,
      this.retailPrice,
      this.buyLink,
      this.offers});

  SaleInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    saleability = json['saleability'];
    isEbook = json['isEbook'];
    listPrice = json['listPrice'] != null
        ? new ListPrice.fromJson(json['listPrice'])
        : null;
    retailPrice = json['retailPrice'] != null
        ? new RetailPrice.fromJson(json['retailPrice'])
        : null;
    buyLink = json['buyLink'];
    if (json['offers'] != null) {
      offers = new List<Offers>();
      json['offers'].forEach((v) {
        offers.add(new Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['saleability'] = this.saleability;
    data['isEbook'] = this.isEbook;
    if (this.listPrice != null) {
      data['listPrice'] = this.listPrice.toJson();
    }
    if (this.retailPrice != null) {
      data['retailPrice'] = this.retailPrice.toJson();
    }
    data['buyLink'] = this.buyLink;
    if (this.offers != null) {
      data['offers'] = this.offers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
