class ConsultsForExpert {
  String? message;
  List<Data>? data;

  ConsultsForExpert({this.message, this.data});

  ConsultsForExpert.fromJson(Map<String, dynamic> json) {
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
  User? user;

  Data(
      {this.expertId,
      this.categoryId,
      this.appointment,
      this.isCompleted,
      this.rating,
      this.category,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    expertId = json['expert_id'];
    categoryId = json['category_id'];
    appointment = json['appointment'];
    isCompleted = json['is_completed'];
    rating = json['rating'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    user = json['user'] != null ? User.fromJson(json['expert']) : null;
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
    if (user != null) {
      data['user'] = user!.toJson();
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

class ConsultsForExpertToShow {
  int? expertId;
  int? categoryId;
  String? appointment;
  int? isCompleted;
  int? rating;
  String? name;
  String? catergoryName;

  ConsultsForExpertToShow(
      {this.expertId,
      this.categoryId,
      this.appointment,
      this.isCompleted,
      this.rating,
      this.name,
      this.catergoryName});

  ConsultsForExpertToShow.fromJson(Map<String, dynamic> json) {
    expertId = json['expert_id'];
    categoryId = json['category_id'];
    appointment = json['appointment'];
    isCompleted = json['is_completed'];
    rating = json['rating'];
    name = json['name'];
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
    data['catergory_name'] = catergoryName;

    return data;
  }
}
