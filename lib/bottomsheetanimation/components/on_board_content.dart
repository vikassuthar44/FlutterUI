import 'package:flutter/material.dart';
import 'package:ui_flutter/bottomsheetanimation/components/landend_content.dart';
import 'package:ui_flutter/bottomsheetanimation/components/sign_up_content.dart';

class OnBoardContent extends StatefulWidget {
  const OnBoardContent({Key? key}) : super(key: key);

  @override
  State<OnBoardContent> createState() => _OnBoardContentState();
}

class _OnBoardContentState extends State<OnBoardContent> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double progress =
        pageController.hasClients ? pageController.page ?? 0 : 0;
    return SizedBox(
      height: 400 + progress * 140,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Expanded(
                  child: PageView(
                controller: pageController,
                children: const [LandendContent(), SignUpContent()],
              ))
            ],
          ),
          Positioned(
            height: 56,
            bottom: 32 + progress * 140,
            right: 16,
            child: GestureDetector(
              onTap: () {
                if(pageController.page == 0) {
                  pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [
                          0.4,
                          0.8
                        ],
                        colors: [
                          Color.fromARGB(255, 123, 104, 80),
                          Color.fromARGB(255, 205, 133, 234)
                        ])),
                child: DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 92 + progress * 32,
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            Opacity(
                                opacity: progress,
                                child: const Text(
                                    "Create Account",
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                )
                            ),
                            Opacity(
                              opacity: 1- progress,
                                child: const Text("Get Started")
                            )
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
