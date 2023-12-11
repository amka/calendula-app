class Member {
  final String? firstName;
  final String? lastName;
  final String email;

  final List<String>? roles;

  Member({
    required this.email,
    this.firstName,
    this.lastName,
    this.roles,
  });
}
