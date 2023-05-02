import 'package:flutter/material.dart';
import 'package:safee/extension/widget_extension.dart';
import 'package:safee/presentation/widgets/button/button.dart';
import 'package:safee/presentation/widgets/widget.dart';
import 'package:safee/styles/asset.dart';
import 'package:safee/styles/style.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const String routeName = '/login';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //VARIABLES
  PageController _pageController = PageController();
  List<Map<String, dynamic>> onboardingData = [
    {"image": ONBOARDING_0, "text": "Empower your money, simplify your life."},
    {"image": ONBOARDING_1, "text": "Live your fullest life.", "isLast": true}
  ];
  ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            PageView(
              onPageChanged: (index) {
                currentIndex.value = index;
              },
              controller: _pageController,
              children: [
                for (Map<String, dynamic> data in onboardingData)
                  OnboardingBody(
                    image: data["image"],
                    text: data['text'],
                    isLast: data["isLast"] ?? false,
                    pageController: _pageController,
                  )
              ],
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.25,
              left: MediaQuery.of(context).size.width * 0.36,
              right: MediaQuery.of(context).size.width * 0.34,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Indicator(positionIndex: 0, currentIndex: currentIndex),
                  Indicator(positionIndex: 1, currentIndex: currentIndex)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingBody extends StatefulWidget {
  const OnboardingBody(
      {super.key,
      required this.image,
      required this.text,
      required this.isLast,
      required this.pageController});
  final String image;
  final String text;
  final bool isLast;
  final PageController pageController;

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  //ANIMATIONS
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        65.0.height,
        Text('Welcome to', style: heading1StylePurple),
        Text(
          'Safee',
          style: heading1StyleBlack,
        ),
        50.0.height,
        Image.asset(
          widget.image,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3,
        ),
        Center(
          child: Text(
            widget.text,
            style: copyRegularStyleBlack,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Flexible(
              child: Visibility(
            visible: widget.isLast ? true : false,
            child: PrimaryButton(
                title: 'Previous',
                isPurple: false,
                callback: () => widget.pageController
                    .previousPage(duration: _kDuration, curve: _kCurve)),
          )),
        ),
        20.0.height,
        Padding(
          padding: const EdgeInsets.only(bottom: 40, left: 10, right: 10),
          child: Flexible(
            child: PrimaryButton(
                title: !widget.isLast ? 'Next' : 'Finish',
                isPurple: true,
                callback: () => !widget.isLast
                    ? widget.pageController
                        .nextPage(duration: _kDuration, curve: _kCurve)
                    : () {}),
          ),
        )
      ],
    );
  }
}
