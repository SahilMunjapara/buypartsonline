import 'dart:async';
import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    Key? key,
    required this.items,
    this.pagerSize,
    this.passiveIndicator,
    this.activeIndicator,
    this.pagination,
    this.height,
    this.aspectRatio = 16 / 9,
    this.viewportFraction = 0.8,
    this.initialPage = 0,
    this.enableInfiniteScroll = true,
    this.reverse = false,
    this.autoPlay = false,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
    this.autoPlayCurve = Curves.fastOutSlowIn,
    this.pauseAutoPlayOnTouch,
    this.enlargeMainPage = false,
    this.onPageChanged,
    this.scrollPhysics,
    this.scrollDirection = Axis.horizontal,
  }) : super(key: key);

  final double? pagerSize;

  final Color? activeIndicator;

  final Color? passiveIndicator;

  final bool? pagination;

  final List<Widget> items;

  final double? height;

  final double aspectRatio;

  final num viewportFraction;

  final int initialPage;

  final bool enableInfiniteScroll;

  final bool reverse;

  final bool autoPlay;

  final Duration autoPlayInterval;

  final Duration autoPlayAnimationDuration;

  final Curve autoPlayCurve;

  final Duration? pauseAutoPlayOnTouch;

  final bool enlargeMainPage;

  final Axis scrollDirection;

  final Function(int index)? onPageChanged;

  final ScrollPhysics? scrollPhysics;

  List<T> map<T>(List list, Function handler) {
    List<T> result;
    result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  _BannerCarouselState createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel>
    with TickerProviderStateMixin {
  Timer? timer;

  double size = 0;

  double width = 0;

  late PageController pageController;

  int realPage = 10000;
  int? currentSlide;

  @override
  void initState() {
    super.initState();
    currentSlide = widget.initialPage;
    realPage = widget.enableInfiniteScroll
        ? realPage + widget.initialPage
        : widget.initialPage;
    pageController = PageController(
        viewportFraction: widget.viewportFraction as double,
        initialPage: realPage);
    timer = getPlayTimer();
  }

  Timer getPlayTimer() => Timer.periodic(widget.autoPlayInterval, (_) {
        if (widget.autoPlay && widget.items.length > 1) {
          pageController.nextPage(
              duration: widget.autoPlayAnimationDuration,
              curve: widget.autoPlayCurve);
        }
      });

  void pauseOnTouch() {
    timer?.cancel();
    timer = Timer(widget.pauseAutoPlayOnTouch!, () {
      timer = getPlayTimer();
    });
  }

  Widget getPageWrapper(Widget child) {
    if (widget.height != null) {
      final Widget wrapper = SizedBox(height: widget.height, child: child);
      return widget.autoPlay && widget.pauseAutoPlayOnTouch != null
          ? addGestureDetection(wrapper)
          : wrapper;
    } else {
      final Widget wrapper =
          AspectRatio(aspectRatio: widget.aspectRatio, child: child);
      return widget.autoPlay && widget.pauseAutoPlayOnTouch != null
          ? addGestureDetection(wrapper)
          : wrapper;
    }
  }

  Widget addGestureDetection(Widget child) =>
      GestureDetector(onPanDown: (_) => pauseOnTouch(), child: child);

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void onPageSlide(int index) {
    setState(() => currentSlide = index);
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          getPageWrapper(PageView.builder(
            physics: widget.scrollPhysics,
            scrollDirection: widget.scrollDirection,
            controller: pageController,
            reverse: widget.reverse,
            itemCount: widget.enableInfiniteScroll ? null : widget.items.length,
            onPageChanged: (int index) {
              int currentPage;

              currentPage = _getRealIndex(
                  index + widget.initialPage, realPage, widget.items.length);
              if (widget.onPageChanged != null) {
                widget.onPageChanged!(currentPage);
              }
              if (widget.pagination == true) {
                onPageSlide(currentPage);
              }
            },
            itemBuilder: (BuildContext context, int i) {
              int index;
              index = _getRealIndex(
                i + widget.initialPage,
                realPage,
                widget.items.length,
              );
              currentSlide = widget.initialPage;
              return AnimatedBuilder(
                animation: pageController,
                child: widget.items[index],
                builder: (BuildContext context, child) {
                  double value;
                  try {
                    value = pageController.page! - i;
                  } catch (e) {
                    final BuildContext storageContext =
                        pageController.position.context.storageContext;
                    final double? previousSavedPosition =
                        PageStorage.of(storageContext)
                            ?.readState(storageContext);
                    if (previousSavedPosition != null) {
                      value = previousSavedPosition - i.toDouble();
                    } else {
                      value = realPage.toDouble() - i.toDouble();
                    }
                  }
                  value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);

                  final double height = widget.height ??
                      MediaQuery.of(context).size.width *
                          (1 / widget.aspectRatio);

                  final double distortionValue = widget.enlargeMainPage
                      ? Curves.easeOut.transform(value)
                      : 1.0;

                  if (widget.scrollDirection == Axis.horizontal) {
                    return Center(
                      child: SizedBox(
                        height: distortionValue * height,
                        child: child,
                      ),
                    );
                  } else {
                    return Center(
                      child: SizedBox(
                          width: distortionValue *
                              MediaQuery.of(context).size.width,
                          child: child),
                    );
                  }
                },
              );
            },
          )),
          widget.pagination == true
              ? Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.map<Widget>(
                        widget.items,
                        (pagerIndex, url) => Container(
                          width: widget.pagerSize ?? 8.0,
                          height: widget.pagerSize ?? 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentSlide == pagerIndex
                                ? widget.activeIndicator == null
                                    ? const Color.fromRGBO(0, 0, 0, 0.9)
                                    : widget.activeIndicator!
                                : widget.passiveIndicator == null
                                    ? const Color.fromRGBO(0, 0, 0, 0.4)
                                    : widget.passiveIndicator!,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      );
}

int _getRealIndex(int position, int base, int length) {
  final int offset = position - base;
  return _remainder(offset, length);
}

int _remainder(int input, int source) {
  final int result = input % source;
  return result < 0 ? source + result : result;
}
