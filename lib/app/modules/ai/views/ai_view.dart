import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:esortcli/app/routes/app_pages.dart';
import 'package:esortcli/app/widgets/ai_dialog.dart';
import 'package:esortcli/app/widgets/custom_bottom_navigation_bar.dart';
import 'package:esortcli/app/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';

class AiView extends StatefulWidget {
  @override
  _AiViewState createState() => _AiViewState();
}

class _AiViewState extends State<AiView> with SingleTickerProviderStateMixin {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _speechInitialized = false;

  @override
  void initState() {
    super.initState();
    _initSpeech();
    _requestPermission();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initSpeech() async {
    _speechInitialized = await _speech.initialize(
      onError: (error) => print('Error: $error'),
      onStatus: (status) {
        print('Status: $status');
        if (status == 'notListening') {
          setState(() => _isListening = false);
          _animationController.stop();
        }
      },
    );

    print('Speech initialized: $_speechInitialized');
  }

  void _requestPermission() async {
    var status = await Permission.microphone.request();
    if (status.isGranted) {
      print('Microphone permission granted');
    } else {
      print('Microphone permission denied');
    }
  }

  void _listen() async {
    if (!_isListening) {
      _animationController.reset();
      _animationController.repeat();

      if (!_speechInitialized) {
        _speechInitialized = await _speech.initialize(
          onStatus: (status) => print('Status: $status'),
          onError: (errorNotification) => print('Error: $errorNotification'),
        );
      }

      if (_speechInitialized) {
        setState(() => _isListening = true);

        _speech.listen(
          onResult:
              (result) => setState(() {
                _text = result.recognizedWords;
              }),
        );
      } else {
        setState(() => _isListening = true);
        print("Speech recognition not available");
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
      _animationController.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.blackColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.HOME);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          ImageAssets.back_button,
                          height: 24,
                          width: 12,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Back',
                          style: TextStyle(
                            color: AppColor.defaultColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    ImageAssets.delete,
                    height: 20,
                    width: 20,
                    color: AppColor.redColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    ImageAssets.double_star,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'I am here to make your work easier.',
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            if (_text.isNotEmpty)
                              Container(
                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  _text,
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            SizedBox(height: 30),
                            GestureDetector(
                              onTap: _listen,
                              child: AnimatedBuilder(
                                animation: _animation,
                                builder: (context, child) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      if (_animationController.isAnimating)
                                        ...List.generate(5, (index) {
                                          final opacity =
                                              1.0 -
                                              (_animation.value *
                                                  (index + 1) /
                                                  5);
                                          final scale =
                                              1.0 +
                                              (_animation.value *
                                                  (index + 1) *
                                                  0.5);
                                          return Opacity(
                                            opacity: opacity.clamp(0.0, 0.7),
                                            child: Container(
                                              width: 120 * scale,
                                              height: 120 * scale,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Color.fromRGBO(
                                                    121,
                                                    167,
                                                    141,
                                                    1,
                                                  ).withOpacity(0.5),
                                                  width: 1.5,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color:
                                              _isListening
                                                  ? Color.fromRGBO(
                                                    121,
                                                    167,
                                                    141,
                                                    1,
                                                  ).withOpacity(0.9)
                                                  : Color.fromRGBO(
                                                    121,
                                                    167,
                                                    141,
                                                    1,
                                                  ),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.1,
                                              ),
                                              blurRadius: 8,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Icon(
                                          Icons.mic,
                                          size: 40,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.dialog(AiDialog(onConfirm: () {}));
                    },
                    child: SvgPicture.asset(
                      ImageAssets.ai_note,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  const SizedBox(height: 30),
                  RoundButton(
                    title: 'Confirm',
                    onPress: () {
                      Get.toNamed(Routes.TASK);
                    },
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    radius: 10,
                    height: 50,
                    buttonColor: AppColor.defaultColor,
                    textColor: AppColor.whiteColor,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            CustomBottomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
