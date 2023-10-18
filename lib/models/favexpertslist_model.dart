class FavExperts {
  List<Data>? data;

  FavExperts({this.data});

  FavExperts.fromJson(Map<String, dynamic> json) {
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
  Expert? expert;

  Data({this.expertId, this.expert});

  Data.fromJson(Map<String, dynamic> json) {
    expertId = json['expert_id'];
    expert = json['expert'] != null ? Expert.fromJson(json['expert']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expert_id'] = expertId;
    if (expert != null) {
      data['expert'] = expert!.toJson();
    }
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

class FavExpertsToShow {
  int? expertId;
  String? imagePath;
  String? name;

  FavExpertsToShow({this.expertId, this.imagePath, this.name});

  FavExpertsToShow.fromJson(Map<String, dynamic> json) {
    expertId = json['expert_id'];
    imagePath = json['image_path'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expert_id'] = expertId;
    data['image_path'] = imagePath;
    data['name'] = name;
    return data;
  }
}
