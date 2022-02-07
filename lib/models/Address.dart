class Address{
  String address;
  int governate_id;

  Address({
    required this.address,
    required this.governate_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'address': this.address,
      'governate_id': this.governate_id,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      address: map['address'] as String,
      governate_id: map['governate_id'] as int,
    );
  }
}