class CategoryGoodsListModel {
  bool state;
  Null errorMsg;
  List<CategoryListData> data;
  Null page;
  Null limit;

  CategoryGoodsListModel({
    this.state,
    this.errorMsg,
    this.data,
    this.page,
    this.limit
  });

  CategoryGoodsListModel.fromJson(Map<String, dynamic> json)
  {
    state = json['state'];
    errorMsg = json['errorMsg'];
    if (json['data'] != null) {
      data = new List<CategoryListData>();
      json['data'].forEach((v) {
        data.add(new CategoryListData.fromJson(v));
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

class CategoryListData {
  String image;
  double oriPrice;
  double presentPrice;
  String goodsName;
  String goodsId;

  CategoryListData(
      {this.image,
        this.oriPrice,
        this.presentPrice,
        this.goodsName,
        this.goodsId});

  CategoryListData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];
    goodsName = json['goodsName'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['goodsName'] = this.goodsName;
    data['goodsId'] = this.goodsId;
    return data;
  }
}