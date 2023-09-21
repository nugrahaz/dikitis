class Symptom {
  String id, name, description;

  Symptom({
    this.id = "",
    this.name = "",
    this.description = "",
  });

  factory Symptom.fromJson(Map<String, dynamic> json) => Symptom(
        id: json["symptom_id"],
        name: json["symptom_name"],
        description: json["symptom_description"],
      );
  //
  // Map<String, dynamic> toJson() => {
  //       "kode_gejala": code,
  //       "nama_gejala": gejala,
  //       "deskripsi": description,
  //     };
}
