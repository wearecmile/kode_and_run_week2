class User {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? countryCode;
  String? phoneNumber;
  String? imageURL;
  bool? isCaptain;

  User(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.countryCode,
      this.phoneNumber,
      this.imageURL,
      this.isCaptain});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    countryCode = json['countryCode'];
    phoneNumber = json['phoneNumber'];
    imageURL = json['imageURL'];
    isCaptain = json['isCaptain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['countryCode'] = this.countryCode;
    data['phoneNumber'] = this.phoneNumber;
    data['imageURL'] = this.imageURL;
    data['isCaptain'] = this.isCaptain;
    return data;
  }
}

/*
*
*
* [{
  "id": 1,
  "first_name": "Jan",
  "last_name": "Rewbottom",
  "email": "jrewbottom0@bluehost.com",
  "phoneNumber": "6242244209",
  "countryCode": "8755",
  "isCaptain": true
}, {
  "id": 2,
  "first_name": "Porty",
  "last_name": "Tourville",
  "email": "ptourville1@ibm.com",
  "phoneNumber": "7564071890",
  "countryCode": "89",
  "isCaptain": true
}, {
  "id": 3,
  "first_name": "Margarette",
  "last_name": "Retchford",
  "email": "mretchford2@behance.net",
  "phoneNumber": "8345063075",
  "countryCode": "1018",
  "isCaptain": false
}, {
  "id": 4,
  "first_name": "Hadlee",
  "last_name": "Leither",
  "email": "hleither3@freewebs.com",
  "phoneNumber": "2066505845",
  "countryCode": "6",
  "isCaptain": false
}, {
  "id": 5,
  "first_name": "Petr",
  "last_name": "Kesby",
  "email": "pkesby4@networkadvertising.org",
  "phoneNumber": "3158578092",
  "countryCode": "06",
  "isCaptain": true
}, {
  "id": 6,
  "first_name": "Gardy",
  "last_name": "Castaner",
  "email": "gcastaner5@miibeian.gov.cn",
  "phoneNumber": "5945324994",
  "countryCode": "41",
  "isCaptain": true
}, {
  "id": 7,
  "first_name": "Emilie",
  "last_name": "Nendick",
  "email": "enendick6@mail.ru",
  "phoneNumber": "4952473718",
  "countryCode": "63317",
  "isCaptain": false
}, {
  "id": 8,
  "first_name": "Melita",
  "last_name": "Orae",
  "email": "morae7@webmd.com",
  "phoneNumber": "7758467053",
  "countryCode": "7",
  "isCaptain": false
}, {
  "id": 9,
  "first_name": "Dredi",
  "last_name": "Langdridge",
  "email": "dlangdridge8@constantcontact.com",
  "phoneNumber": "9813819796",
  "countryCode": "98",
  "isCaptain": false
}, {
  "id": 10,
  "first_name": "Dalila",
  "last_name": "Laingmaid",
  "email": "dlaingmaid9@phoca.cz",
  "phoneNumber": "7179814366",
  "countryCode": "9",
  "isCaptain": false
}]
* */
