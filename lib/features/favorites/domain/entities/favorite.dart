import 'package:equatable/equatable.dart';

class Favorite extends Equatable {
  final String name;
  final String package;
  final String icon;

  const Favorite({
    required this.name,
    required this.package,
    required this.icon,
  });

  @override
  List<Object?> get props => [name, package, icon];
}
