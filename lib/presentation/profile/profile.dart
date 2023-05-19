import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safee/bloc/authentication/authentication_bloc.dart';
import 'package:safee/bloc/authentication/states/get_user_states.dart';
import 'package:safee/data/authentication/model/firebase_user_response.dart';
import 'package:safee/presentation/profile/component/profile_divider.dart';
import 'package:safee/styles/asset.dart';
import 'package:safee/styles/style.dart';
import 'package:safee/util/toast_utils.dart';
import 'package:safee/util/util.dart';
import 'component/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseUserResponse user = FirebaseUserResponse('', '', '');

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() async {
    context.read<AuthenticationBloc>().add(const GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, state) {
        return state is GetUserLoadingState ||
            state is GetUserFailedState ||
            state is GetUserSuccessState;
      },
      listener: (context, state) {
        if (state is GetUserLoadingState) {
          showLoading();
        }

        if (state is GetUserSuccessState) {
          hideLoading();
          setState(() {
            user = state.user;
          });
        }

        if (state is GetUserFailedState) {
          hideLoading();

          showToast(state.message);
        }
      },
      child: Scaffold(body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileHeader(user: user),
                const ProfileDivider('Account'),
                ProfileButton(
                  'Edit Profile',
                  callback: () {},
                  icon: const Icon(
                    Icons.person,
                    color: heavyGray,
                  ),
                ),
                ProfileButton(
                  'My Cards',
                  callback: () {},
                  icon: const Icon(
                    Icons.card_giftcard_rounded,
                  ),
                ),
                ProfileButton(
                  'Promo Code',
                  callback: () {},
                  icon: Image.asset(
                    PROMO_IMAGE,
                    width: 25,
                    height: 25,
                    color: heavyGray,
                  ),
                ),
                const ProfileDivider('Security'),
                ProfileButton(
                  'Privacy & Security',
                  callback: () {},
                  icon: const Icon(
                    Icons.lock_outline,
                    color: heavyGray,
                  ),
                ),
                ProfileButton(
                  'Log out',
                  callback: () {
                    _logout();
                  },
                  icon: const Icon(
                    Icons.power_settings_new_rounded,
                    color: heavyGray,
                  ),
                ),
                const ProfileDivider('About'),
                ProfileButton(
                  'Terms & Conditions',
                  callback: () {},
                  icon: const Icon(
                    Icons.document_scanner_outlined,
                    color: heavyGray,
                  ),
                ),
                ProfileButton(
                  'Help',
                  callback: () {},
                  icon: const Icon(
                    Icons.info_outline,
                    color: heavyGray,
                  ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }

  void _logout() async {
    context.read<AuthenticationBloc>().add(const LogoutEvent());
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton(this.name,
      {super.key, required this.callback, required this.icon});
  final String name;
  final VoidCallback callback;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: secondaryWhite, width: 1))),
      child: ListTile(
        leading: icon,
        title: Text(
          name,
          style: copyRegularStyleBlack,
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          size: 10,
        ),
      ),
    );
  }
}
