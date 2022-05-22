class UserData {
  String? idUser;

  String? nameUser;

  String? passwordUser;

  String? emailUser;

  bool? isWriter;

  String? notes;

  UserData(
      {this.idUser,
      this.nameUser,
      this.passwordUser,
      this.emailUser,
      this.isWriter,
      this.notes});

  Map<String, dynamic> toMap() {
    return {
      'uid': idUser,
      'uname': nameUser,
      'uemail': emailUser,
      'upassword': passwordUser,
      'uwriter': isWriter,
      'unote': notes
    };
  }
}
