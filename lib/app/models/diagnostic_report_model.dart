class DiagnosticReport {
  String? diagnosticId;
  String? userId;
  String? diagnosticDatetime;
  String? diagnosticInformation;

  DiagnosticReport({
    this.diagnosticId = "",
    this.userId,
    this.diagnosticDatetime,
    this.diagnosticInformation = "",
  });

  factory DiagnosticReport.fromJson(Map<String, dynamic> json) => DiagnosticReport(
        diagnosticId: json["diagnostic_id"],
        userId: json["user_id"],
        diagnosticDatetime: json["diagnostic_datetime"],
        diagnosticInformation: json["diagnostic_information"] ?? "",
      );
}
