class UserProfileModel {
  Data? data;

  UserProfileModel({this.data});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Profile? profile;

  Data({this.profile});

  Data.fromJson(Map<String, dynamic> json) {
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? idUser;
  String? name;
  String? lastName;
  String? fatherName;
  String? gender;
  String? birthDate;
  String? mobilePhone;
  String? specialization;
  String? updatedAt;
  String? createdAt;
  int? id;

  Profile(
      {this.idUser,
      this.name,
      this.lastName,
      this.fatherName,
      this.gender,
      this.birthDate,
      this.mobilePhone,
      this.specialization,
      this.updatedAt,
      this.createdAt,
      this.id});

  Profile.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    name = json['name'];
    lastName = json['lastName'];
    fatherName = json['fatherName'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    mobilePhone = json['mobilePhone'];
    specialization = json['specialization'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.idUser;
    data['name'] = this.name;
    data['lastName'] = this.lastName;
    data['fatherName'] = this.fatherName;
    data['gender'] = this.gender;
    data['birthDate'] = this.birthDate;
    data['mobilePhone'] = this.mobilePhone;
    data['specialization'] = this.specialization;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
