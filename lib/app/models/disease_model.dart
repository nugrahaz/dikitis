class Disease {
  String? id, name, description;

  Disease({
    this.id = "",
    this.name = "",
    this.description = "",
  });

  factory Disease.fromJson(Map<String, dynamic> json) => Disease(
        id: json["disease_id"],
        name: json["disease_name"],
        description: json["disease_description"],
      );
}
