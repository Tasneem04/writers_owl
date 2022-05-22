class UserData {

  String? idUser ;
  String? nameUser ;
  String? passwordUser ;
  String? emailUser ;
  bool? isWriter ;

  UserData(
      { this.idUser,
       this.nameUser,
       this.passwordUser,
       this.emailUser,
       this.isWriter});

  Map<String, dynamic> toMap() {
    return {
      'uid': idUser,
      'uname': nameUser,
      'uemail': emailUser,
      'upassword': passwordUser,
      'uwriter': isWriter
    };
  }
}
