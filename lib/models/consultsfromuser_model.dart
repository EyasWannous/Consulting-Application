class Consults {
  String? message;
  List<Data>? data;

  Consults({this.message, this.data});

  Consults.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? expertId;
  int? categoryId;
  String? appointment;
  int? isCompleted;
  int? rating;
  Category? category;
  Expert? expert;

  Data(
      {this.expertId,
      this.categoryId,
      this.appointment,
      this.isCompleted,
      this.rating,
      this.category,
      this.expert});

  Data.fromJson(Map<String, dynamic> json) {
    expertId = json['expert_id'];
    categoryId = json['category_id'];
    appointment = json['appointment'];
    isCompleted = json['is_completed'];
    rating = json['rating'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    expert = json['expert'] != null ? Expert.fromJson(json['expert']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expert_id'] = expertId;
    data['category_id'] = categoryId;
    data['appointment'] = appointment;
    data['is_completed'] = isCompleted;
    data['rating'] = rating;
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

  Category({
    this.name,
  });

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

  User({
    this.name,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class ConsultsToShow {
  int? expertId;
  int? categoryId;
  String? appointment;
  int? isCompleted;
  int? rating;
  String? name;
  String? imagePath;
  String? catergoryName;

  ConsultsToShow(
      {this.expertId,
      this.categoryId,
      this.appointment,
      this.isCompleted,
      this.rating,
      this.name,
      this.imagePath,
      this.catergoryName});

  ConsultsToShow.fromJson(Map<String, dynamic> json) {
    expertId = json['expert_id'];
    categoryId = json['category_id'];
    appointment = json['appointment'];
    isCompleted = json['is_completed'];
    rating = json['rating'];
    name = json['name'];
    imagePath = json['image_path'];
    catergoryName = json['catergory_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expert_id'] = expertId;
    data['category_id'] = categoryId;
    data['appointment'] = appointment;
    data['is_completed'] = isCompleted;
    data['rating'] = rating;
    data['name'] = name;
    data['image_path'] = imagePath;
    data['catergory_name'] = catergoryName;

    return data;
  }
}
