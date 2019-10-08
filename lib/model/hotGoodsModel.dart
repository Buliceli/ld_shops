class HotGoodsModel {
  bool state;
  Null errorMsg;
  List<Data> data;
  Null page;
  Null limit;

  HotGoodsModel({this.state, this.errorMsg, this.data, this.page, this.limit});

  HotGoodsModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    errorMsg = json['errorMsg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    page = json['page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['errorMsg'] = this.errorMsg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['limit'] = this.limit;
    return data;
  }
}

class Data {
  String name;
  String image;
  double mallPrice;
  String goodsId;
  double price;

  Data({this.name, this.image, this.mallPrice, this.goodsId, this.price});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    mallPrice = json['mallPrice'];
    goodsId = json['goodsId'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['mallPrice'] = this.mallPrice;
    data['goodsId'] = this.goodsId;
    data['price'] = this.price;
    return data;
  }
}