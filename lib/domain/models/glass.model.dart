class Glass {
  String? strGlass;

  Glass({
    this.strGlass,
  });

  Glass.fromJson(Map<String, dynamic> json) {
    strGlass = json['strGlass'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'strGlass': strGlass,
    };
  }
}
