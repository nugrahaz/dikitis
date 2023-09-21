class Rule {
  String? idRule, idDisease, idSymptom;

  Rule({
    this.idRule,
    this.idDisease = "",
    this.idSymptom = "",
  });

  factory Rule.fromJson(Map<String, dynamic> json) => Rule(
        idRule: json["rule_id"],
        idDisease: json["disease_id"],
        idSymptom: json["symptom_id"],
      );
}
