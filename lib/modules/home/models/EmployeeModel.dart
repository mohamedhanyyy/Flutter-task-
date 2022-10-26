import 'package:equatable/equatable.dart';

class EmployeeModel extends Equatable {
  String? image;
  String? name;
  String? title;
  bool?  isFav;
  double? rate;

  EmployeeModel({
    this.image,
    this.name,
    this.title,
    this.isFav,
    this.rate,
  });

  EmployeeModel.fromJson(dynamic json) {
    image = json['image'];
    name = json['name'];
    title = json['title'];
    isFav = json['isFav'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    map['name'] = name;
    map['title'] = title;
    map['isFav'] = isFav;
    map['rate'] = rate;
    return map;
  }

  @override
  List<Object?> get props => [image, name, title, isFav, rate];
}
