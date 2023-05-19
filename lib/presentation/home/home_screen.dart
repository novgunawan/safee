import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safee/bloc/authentication/authentication_bloc.dart';
import 'package:safee/bloc/authentication/states/get_user_states.dart';
import 'package:safee/data/authentication/model/firebase_user_response.dart';
import 'package:safee/extension/widget_extension.dart';
import 'package:safee/presentation/reusable_widgets/widget.dart';
import 'package:safee/styles/asset.dart';
import 'package:safee/styles/style.dart';
import 'package:safee/util/toast_utils.dart';
import 'package:safee/util/util.dart';

import 'components/offer.dart';
import 'components/payment_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _getUser() async {
    context.read<AuthenticationBloc>().add(const GetUserEvent());
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  FirebaseUserResponse user = FirebaseUserResponse('', '', '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  60.0.height,
                  HomeBalanceWidget(
                    user: user,
                  ),
                  15.0.height,
                  Text(
                    'Payment List',
                    style: bodyBoldStyleBlack,
                  ),
                  const PaymentGrid(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today\'s Offer',
                        style: bodyBoldStyleBlack,
                      ),
                      Text(
                        'View More',
                        style: captionRegularStyleGray,
                      )
                    ],
                  ),
                  20.0.height,
                  const OfferSection()
                ],
              ),
            ),
          );
        }),
      ),
    ));
  }
}

class HomeBalanceWidget extends StatelessWidget {
  const HomeBalanceWidget({
    super.key,
    required this.user,
  });
  final FirebaseUserResponse user;

  @override
  Widget build(BuildContext context) {
    // TODO(feat/home): change data dynamically
    return PurpleContainer(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ${user.name}',
                      style: heading3StyleWhite,
                    ),
                    4.0.height,
                    Text(
                      'Premium User',
                      style: captionRegularStyleWhite,
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your balance',
                    style: captionRegularStyleWhite,
                  ),
                  4.0.height,
                  Text(
                    '\$ 00.00',
                    style: heading4StyleGreen,
                  )
                ],
              )
            ],
          ),
          28.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    SEND_IMAGE,
                    height: 25,
                    width: 25,
                  ),
                  5.0.width,
                  Text(
                    'Send Money',
                    style: bodyRegularStyleWhite,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    HISTORY_IMAGE,
                    height: 25,
                    width: 25,
                  ),
                  5.0.width,
                  Text(
                    'History',
                    style: bodyRegularStyleWhite,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
