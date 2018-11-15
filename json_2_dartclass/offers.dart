import 'list_price.dart';
import 'retail_price.dart';

class Offers {
  int finskyOfferType;
  ListPrice listPrice;
  RetailPrice retailPrice;
  bool giftable;

  Offers(
      {this.finskyOfferType, this.listPrice, this.retailPrice, this.giftable});

  Offers.fromJson(Map<String, dynamic> json) {
    finskyOfferType = json['finskyOfferType'];
    listPrice = json['listPrice'] != null
        ? new ListPrice.fromJson(json['listPrice'])
        : null;
    retailPrice = json['retailPrice'] != null
        ? new RetailPrice.fromJson(json['retailPrice'])
        : null;
    giftable = json['giftable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['finskyOfferType'] = this.finskyOfferType;
    if (this.listPrice != null) {
      data['listPrice'] = this.listPrice.toJson();
    }
    if (this.retailPrice != null) {
      data['retailPrice'] = this.retailPrice.toJson();
    }
    data['giftable'] = this.giftable;
    return data;
  }
}
