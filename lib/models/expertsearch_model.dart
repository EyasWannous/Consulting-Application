class ExpertSearch {
  int? id;
  String? name;
  ExpertSearch({
    this.id,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  ExpertSearch.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
