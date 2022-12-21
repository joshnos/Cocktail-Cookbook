class Category {
  String? strCategory;

  Category({
    this.strCategory,
  });

  Category.fromJson(Map<String, dynamic> json) {
    strCategory = json['strCategory'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'strCategory': strCategory,
    };
  }
}
