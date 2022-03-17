import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:klikdaily/presentation/pages/home_page.dart';
import 'package:klikdaily/themes/theme.dart';

class AppIntroPage extends StatefulWidget {
  static const routeName = "/app-intro";

  const AppIntroPage({Key? key}) : super(key: key);

  @override
  State<AppIntroPage> createState() => _AppIntroPageState();
}

class _AppIntroPageState extends State<AppIntroPage> {
  List<Slide> slides = [
    Slide(
      title: "Kesegaran Jasmani",
      description: "Dapatkan sayuran dalam kondisi segara dan kualitas terbaik",
      pathImage: "assets/images/onboarding_1.png",
    ),
    Slide(
      title: "Langsung Dipetik",
      description:
          "Sayuran yang kami sediakan dalam kondisi terbaik langsung dipetik dari kebun",
      pathImage: "assets/images/onboarding_2.png",
    ),
    Slide(
      title: "Diantar Langsung",
      description:
          "Setelah sayuran dipetik kebun kami langsung mengirimkannya untuk Anda",
      pathImage: "assets/images/onboarding_3.png",
    ),
  ];

  void onDonePress() {
    Navigator.pushNamedAndRemoveUntil(
        context, HomePage.routeName, (route) => false);
  }

  Widget renderNextBtn() {
    return Text(
      'Selanjutnya',
      style: bold.copyWith(
        color: Colors.white,
      ),
    );
  }

  Widget renderDoneBtn() {
    return Text(
      'Mulai',
      style: bold.copyWith(
        color: Colors.white,
      ),
    );
  }

  Widget renderSkipBtn() {
    return Text(
      'Lewati',
      style: bold.copyWith(
        color: Colors.white,
      ),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(green),
      overlayColor: MaterialStateProperty.all<Color>(yellow),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];

    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(color: Colors.white),
          child: Container(
            margin: const EdgeInsets.only(bottom: 60.0, top: 60.0),
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                    child: Image.asset(
                  currentSlide.pathImage ?? "assets/images/onboarding_1.png",
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.contain,
                )),
                Container(
                  child: Text(
                    currentSlide.title ?? "",
                    style: bold.copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  margin: const EdgeInsets.only(top: 20.0),
                ),
                Container(
                  child: Text(
                    currentSlide.description ?? "",
                    style: regular,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: const EdgeInsets.only(top: 20.0),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IntroSlider(
          // List slides
          slides: slides,

          // Skip button
          renderSkipBtn: renderSkipBtn(),
          skipButtonStyle: myButtonStyle(),

          // Next button
          renderNextBtn: renderNextBtn(),
          nextButtonStyle: myButtonStyle(),

          // Done button
          renderDoneBtn: renderDoneBtn(),
          onDonePress: onDonePress,
          doneButtonStyle: myButtonStyle(),

          // Dot indicator
          colorDot: Colors.grey,
          colorActiveDot: green,
          sizeDot: 8.0,

          // Show or hide status bar
          // hideStatusBar: true,
          backgroundColorAllSlides: Colors.white,
          listCustomTabs: renderListCustomTabs(),

          // Scrollbar
          // verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
        ),
      ),
    );
  }
}
