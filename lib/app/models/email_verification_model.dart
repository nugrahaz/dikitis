class Verification {
  String id;
  String email;
  String codeVerification;

  Verification({
    this.id = "",
    this.email = "",
    this.codeVerification = "",
  });

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        id: json["verification_id"].toString(),
        email: json["user_email"].toString(),
        codeVerification: json["verification_code"].toString(),
      );
}
