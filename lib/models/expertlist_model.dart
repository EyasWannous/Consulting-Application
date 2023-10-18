class EData {
  List<Data>? data;

  EData({this.data});

  EData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? expertId;
  int? price;
  Category? category;
  Expert? expert;

  Data({this.expertId, this.price, this.category, this.expert});

  Data.fromJson(Map<String, dynamic> json) {
    expertId = json['expert_id'];
    price = json['price'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    expert = json['expert'] != null ? Expert.fromJson(json['expert']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expert_id'] = expertId;
    data['price'] = price;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (expert != null) {
      data['expert'] = expert!.toJson();
    }
    return data;
  }
}

class Category {
  String? name;

  Category({this.name});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Expert {
  String? imagePath;
  User? user;

  Expert({this.imagePath, this.user});

  Expert.fromJson(Map<String, dynamic> json) {
    imagePath = json['image_path'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_path'] = imagePath;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;

  User({this.name});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class ServicesByCatId {
  int? expertId;
  int? price;
  String? categoryName;
  String? imagePath;
  String? userName;

  ServicesByCatId(
      {this.expertId,
      this.price,
      this.categoryName,
      this.imagePath,
      this.userName});

  ServicesByCatId.fromJson(Map<String, dynamic> json) {
    expertId = json['expert_id'];
    price = json['price'];
    categoryName = json['category_name'];
    imagePath = json['image_path'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expert_id'] = expertId;
    data['price'] = price;
    data['category_name'] = categoryName;
    data['image_path'] = imagePath;
    data['user_name'] = userName;
    return data;
  }
}
