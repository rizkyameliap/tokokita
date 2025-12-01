class Login {
  int? code;
  bool? status;
  String? message;
  String? token;
  int? userID;
  String? userEmail;
  String? userName;

  Login({
    this.code,
    this.status,
    this.message,
    this.token,
    this.userID,
    this.userEmail,
    this.userName,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      token: json['data']?['token'],
      
      // FIX TERPENTING → paksa parsing int
      userID: int.tryParse(
        json['data']?['user']?['id'].toString() ?? '',
      ),

      userEmail: json['data']?['user']?['email'],
      userName: json['data']?['user']?['nama'],
    );
  }

  bool get isSuccess {
    return status == true && token != null;
  }
}
