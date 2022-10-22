class SliderObject {
  String? title;
  String? subTitle;
  String? image;
  SliderObject(this.title, this.subTitle, this.image);
}

class Customer {
  String id;
  String name;
  int numOfNotification;
  Customer(this.id, this.name, this.numOfNotification);
}

class Contacts {
  String email;
  String phone;
  int link;
  Contacts(this.email, this.link, this.phone);
}

class Authentication {
  Customer? customer;
  Contacts? contacts;
  Authentication(this.customer, this.contacts);
}

class DeviceInfo {
  String name;
  String identifirs;
  String version;
  DeviceInfo(this.identifirs, this.name, this.version);
}
