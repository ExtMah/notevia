class ModelCategory {
  int? id;
  String? name;
  int? parentId;
  int? userId;
  int? deleted;

  ModelCategory({this.id, this.name, this.parentId, this.userId, this.deleted});

  ModelCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
    userId = json['user_id'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parent_id'] = this.parentId;
    data['user_id'] = this.userId;
    data['deleted'] = this.deleted;
    return data;
  }
}
