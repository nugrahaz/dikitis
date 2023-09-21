class User {
  String? id;
  String? email;
  String? password;
  String? role;
  int? isActive;

  User({
     this.id,
     this.email,
     this.password,
     this.role,
     this.isActive,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["user_id"] ?? "none",
        email: json["user_email"] ?? "none",
        password: json["user_password"] ?? "none",
        role: json["user_role"] ?? "patient",
        isActive: int.parse(json["user_is_active"].toString()),
      );
}

class Patient extends User {
  String? fullname;
  String? photoUrl;
  String? address;

  Patient({
    String id = "",
    String email = "",
    String password = "",
    String role = "patient",
    int isActive = 0,
    //
    this.fullname = "",
    this.photoUrl = "",
    this.address = "",
  }) : super(id: id, email: email, password: password, role: role, isActive: isActive);

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["user_id"],
        email: json["user_email"] ?? "",
        password: json["user_password"] ?? "",
        role: json["user_role"] ?? "patient",
        isActive: int.parse(json["user_is_active"].toString()),
        //
        fullname: json["patient_fullname"] ?? "",
        photoUrl: json["patient_photo_url"] ?? "",
        address: json["patient_address"] ?? "",
      );
}

class Doctor extends User {
  String? fullname;
  String? address;

  Doctor({
    String id = "",
    String email = "",
    String password = "",
    String role = "doctor",
    int isActive = 0,
    //
    this.fullname = "",
    this.address = "",
  }) : super(id: id, email: email, password: password, role: role, isActive: isActive);

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["user_id"],
    email: json["user_email"] ?? "",
    password: json["user_password"] ?? "",
    role: json["user_role"] ?? "doctor",
    isActive: int.parse(json["user_is_active"].toString()),
    //
    fullname: json["doctor_fullname"] ?? "",
    address: json["doctor_address"] ?? "",
  );
}

