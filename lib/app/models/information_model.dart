class Information {
  final String? id;
  final String? title;
  final String? description;

  const Information({
    this.id = "",
    this.title = "",
    this.description = "",
  });

  factory Information.fromJson(Map<String, dynamic> json) => Information(
        id: json["information_id"],
        title: json["information_title"],
        description: json["information_description"],
      );

  // Map<String, dynamic> toJson() => {
  //       "kode_informasi": id,
  //       "judul": title,
  //       "deskripsi": description,
  //     };
}
