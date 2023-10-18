class ExpertProfileById {
  bool? isFavourite;
  String? rating;
  Data? data;

  ExpertProfileById({this.isFavourite, this.rating, this.data});

  ExpertProfileById.fromJson(Map<String, dynamic> json) {
    isFavourite = json['is_favourite'];
    rating = json['rating'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_favourite'] = isFavourite;
    data['rating'] = rating;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? address;
  String? imagePath;
  String? experience;
  User? user;

  Data({this.address, this.imagePath, this.experience, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    imagePath = json['image_path'];
    experience = json['experience'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['image_path'] = imagePath;
    data['experience'] = experience;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? phoneNumber;
  int? balance;

  User({this.name, this.email, this.phoneNumber, this.balance});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['balance'] = balance;
    return data;
  }
}

class ExpertProfileFormUser {
  bool? isFavourite;
  String? rating;
  String? address;
  String? imagePath;
  String? experience;
  String? name;
  String? email;
  String? phoneNumber;
  int? balance;

  ExpertProfileFormUser(
      {this.isFavourite,
      this.rating,
      this.address,
      this.imagePath,
      this.experience,
      this.name,
      this.email,
      this.phoneNumber,
      this.balance});

  ExpertProfileFormUser.fromJson(Map<String, dynamic> json) {
    isFavourite = json['is_favourite'];
    rating = json['rating'];
    address = json['address'];
    imagePath = json['image_path'];
    experience = json['experience'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_favourite'] = isFavourite;
    data['rating'] = rating;
    data['address'] = address;
    data['image_path'] = imagePath;
    data['experience'] = experience;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['balance'] = balance;
    return data;
  }
}
