import 'package:equatable/equatable.dart';

class OnlineExpertModel extends Equatable {
final String name;
final String image;

  const OnlineExpertModel({required this.name, required this.image});

  @override
  List<Object?> get props => [name, image];
}
