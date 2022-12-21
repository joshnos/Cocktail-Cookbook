class AlcoholicFilter {
  String? strAlcoholic;

  AlcoholicFilter({
    this.strAlcoholic,
  });

  AlcoholicFilter.fromJson(Map<String, dynamic> json) {
    strAlcoholic = json['strAlcoholic'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'strAlcoholic': strAlcoholic,
    };
  }
}
