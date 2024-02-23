import 'package:flutter/material.dart';

class MemberItem extends StatelessWidget {
  const MemberItem(this.data);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data["name"]),
      subtitle: Text("${data['age']} Tahun"),
    );
  }
}
