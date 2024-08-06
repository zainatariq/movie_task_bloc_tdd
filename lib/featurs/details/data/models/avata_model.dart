class UpdateResponse {
  final bool success;
  final int statusCode;
  final String statusMessage;

  UpdateResponse({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

   factory UpdateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateResponse(
      success: json['success'],
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status_code': statusCode,
      'status_message': statusMessage,
    };
  }
}
