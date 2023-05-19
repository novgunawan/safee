import 'package:flutter/material.dart';
import 'package:safee/data/authentication/model/firebase_user_response.dart';
import 'package:safee/styles/style.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.user,
  });
  final FirebaseUserResponse user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: secondaryWhite,
          radius: 61,
          backgroundImage: NetworkImage(user.picture),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: bodyBoldStyleBlack,
            ),
            Text(
              user.email,
              style: copyRegularStyleBlack,
            ),
            Text(
              '+62 882 2483 2431',
              style: copyRegularStyleBlack,
            )
          ],
        )
      ],
    );
  }
}
