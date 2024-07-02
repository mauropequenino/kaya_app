class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String genre;
  final String nationality;
  final String birthDate;
  final String identificationDocType;
  final String identificationDocNumber;
  final String phoneNumber;
  final String email;

  const UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.genre,
    required this.nationality,
    required this.birthDate,
    required this.identificationDocType,
    required this.identificationDocNumber,
    required this.phoneNumber,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'genre': genre,
      'nationality': nationality,
      'birthDate': birthDate,
      'identificationDocType': identificationDocType,
      'identificationDocNumber': identificationDocNumber,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}
