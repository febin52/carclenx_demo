class ProductsListModel {
  ProductsListModel({
      this.status, 
      this.message, 
      this.resultData,});

  ProductsListModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['resultData'] != null) {
      resultData = [];
      json['resultData'].forEach((v) {
        resultData?.add(ResultData.fromJson(v));
      });
    }
  }
  String? status;
  String? message;
  List<ResultData>? resultData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (resultData != null) {
      map['resultData'] = resultData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ResultData {
  ResultData({
      this.id, 
      this.name, 
      this.userId, 
      this.deliverable, 
      this.price, 
      this.modelId, 
      this.categoryId, 
      this.subCategoryId, 
      this.images, 
      this.thumbnail, 
      this.description, 
      this.quantity, 
      this.offerPrice, 
      this.sold, 
      this.status, 
      this.offerId, 
      this.keywords, 
      this.isActive, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.thumbURL, 
      this.imageURL,});

  ResultData.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    userId = json['user_id'];
    deliverable = json['deliverable'] != null ? Deliverable.fromJson(json['deliverable']) : null;
    price = json['price'];
    if (json['model_id'] != null) {
      modelId = [];
      json['model_id'].forEach((v) {
        modelId?.add(ModelId.fromJson(v));
      });
    }
    categoryId = json['category_id'] != null ? CategoryId.fromJson(json['category_id']) : null;
    subCategoryId = json['sub_category_id'] != null ? SubCategoryId.fromJson(json['sub_category_id']) : null;
    images = json['images'] != null ? json['images'].cast<String>() : [];
    thumbnail = json['thumbnail'] != null ? json['thumbnail'].cast<String>() : [];
    description = json['description'];
    quantity = json['quantity'];
    offerPrice = json['offerPrice'];
    sold = json['sold'];
    status = json['status'];
    offerId = json['offerId'];
    keywords = json['keywords'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    thumbURL = json['thumbURL'] != null ? json['thumbURL'].cast<String>() : [];
    imageURL = json['imageURL'] != null ? json['imageURL'].cast<String>() : [];
  }
  String? id;
  String? name;
  String? userId;
  Deliverable? deliverable;
  int? price;
  List<ModelId>? modelId;
  CategoryId? categoryId;
  SubCategoryId? subCategoryId;
  List<String>? images;
  List<String>? thumbnail;
  String? description;
  int? quantity;
  int? offerPrice;
  int? sold;
  int? status;
  dynamic offerId;
  String? keywords;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;
  List<String>? thumbURL;
  List<String>? imageURL;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['user_id'] = userId;
    if (deliverable != null) {
      map['deliverable'] = deliverable?.toJson();
    }
    map['price'] = price;
    if (modelId != null) {
      map['model_id'] = modelId?.map((v) => v.toJson()).toList();
    }
    if (categoryId != null) {
      map['category_id'] = categoryId?.toJson();
    }
    if (subCategoryId != null) {
      map['sub_category_id'] = subCategoryId?.toJson();
    }
    map['images'] = images;
    map['thumbnail'] = thumbnail;
    map['description'] = description;
    map['quantity'] = quantity;
    map['offerPrice'] = offerPrice;
    map['sold'] = sold;
    map['status'] = status;
    map['offerId'] = offerId;
    map['keywords'] = keywords;
    map['isActive'] = isActive;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['thumbURL'] = thumbURL;
    map['imageURL'] = imageURL;
    return map;
  }

}

class SubCategoryId {
  SubCategoryId({
      this.id, 
      this.name, 
      this.categoryId, 
      this.images, 
      this.thumbnail, 
      this.isActive, 
      this.createdAt, 
      this.updatedAt,});

  SubCategoryId.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    categoryId = json['category_id'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    thumbnail = json['thumbnail'] != null ? json['thumbnail'].cast<String>() : [];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? id;
  String? name;
  String? categoryId;
  List<String>? images;
  List<String>? thumbnail;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['category_id'] = categoryId;
    map['images'] = images;
    map['thumbnail'] = thumbnail;
    map['isActive'] = isActive;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}

class CategoryId {
  CategoryId({
      this.id, 
      this.name, 
      this.images, 
      this.thumbnail, 
      this.isActive, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  CategoryId.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    thumbnail = json['thumbnail'] != null ? json['thumbnail'].cast<String>() : [];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? name;
  List<String>? images;
  List<String>? thumbnail;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['images'] = images;
    map['thumbnail'] = thumbnail;
    map['isActive'] = isActive;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}

class ModelId {
  ModelId({
      this.id, 
      this.name, 
      this.makeId, 
      this.carType, 
      this.images, 
      this.thumbnail, 
      this.isActive, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  ModelId.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    makeId = json['make_id'];
    carType = json['carType'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    thumbnail = json['thumbnail'] != null ? json['thumbnail'].cast<String>() : [];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? makeId;
  String? carType;
  List<String>? images;
  List<String>? thumbnail;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['make_id'] = makeId;
    map['carType'] = carType;
    map['images'] = images;
    map['thumbnail'] = thumbnail;
    map['isActive'] = isActive;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}

class Deliverable {
  Deliverable({
      this.coordinates,});

  Deliverable.fromJson(dynamic json) {
    if (json['coordinates'] != null) {
      coordinates = [];
      json['coordinates'].forEach((v) {
        coordinates?.add((v));
      });
    }
  }
  List<dynamic>? coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (coordinates != null) {
      map['coordinates'] = coordinates?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}