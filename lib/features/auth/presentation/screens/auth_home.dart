import 'package:benfy/core/config/app_colors.dart';
import 'package:benfy/core/config/app_images.dart';
import 'package:benfy/core/config/app_routes.dart';
import 'package:benfy/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AuthHome extends StatefulWidget {
  const AuthHome({super.key});

  @override
  State<AuthHome> createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn, _slideUp;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _slideUp = Tween<double>(
      begin: 30.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appSecondaryColor,
      body: Stack(
        children: [
          laterButton(),
          bgCurveVector(),
          bgDotVectors(),
          leafVectors(),
          eggVector(),
          meatVector(),
          orangeVector(),
          peasVector(),
          cheeseVector(),
          legVector(),
          authTextWidget(),
          // authLoginButton(),
          // authCreateAccountButton(),
        ],
      ),
    );
  }

  Positioned laterButton() {
    return Positioned(
      top: 50.h,
      right: 10.w,
      child: SizedBox(
        child: TextButton(
          onPressed: () => Get.offAllNamed(AppRoutes.dashboard),
          style: ButtonStyle(
            enableFeedback: false,
            overlayColor: WidgetStateProperty.all(
              Colors.white.withValues(alpha: 0.1),
            ),
          ),
          child: Text(
            "Later",
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Positioned authCreateAccountButton() {
    return Positioned(
      bottom: 60.h,
      left: 70.w,
      right: 70.w,
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          enableFeedback: false,
          overlayColor: WidgetStateProperty.all(
            Colors.white.withValues(alpha: 0.1),
          ),
        ),
        child: Text(
          "Create New Account",
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Positioned authLoginButton() {
    return Positioned(
      bottom: 105.h,
      left: 20.w,
      right: 20.w,
      child: CustomButton(
        onTap: () => (),
        title: "Login",
        color: AppColors.appPrimaryColor,
      ),
    );
  }

  Positioned authTextWidget() {
    return Positioned(
      bottom: 60.h,
      left: 20.w,
      right: 20.w,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeIn.value,
            child: Transform.translate(
              offset: Offset(0, _slideUp.value),
              child: child,
            ),
          );
        },
        child: Column(
          children: [
            Text(
              "Help your path to health goals with happiness",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Gap(15.h),
            CustomButton(
              onTap: () => Get.offAllNamed(AppRoutes.dashboard),
              title: "Login",
              color: AppColors.appPrimaryColor,
            ),
            Gap(10.h),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                enableFeedback: false,
                overlayColor: WidgetStateProperty.all(
                  Colors.white.withValues(alpha: 0.1),
                ),
              ),
              child: Text(
                "Create New Account",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned legVector() {
    return Positioned(
      top: 315.h,
      right: 40.w,
      child: SvgPicture.asset(AppSvgImages.authHomeLeg),
    );
  }

  Positioned cheeseVector() {
    return Positioned(
      top: 330.h,
      left: 68.w,
      child: SvgPicture.asset(AppSvgImages.authHomeCheese),
    );
  }

  Stack peasVector() {
    return Stack(
      children: [
        Positioned(
          top: 255.h,
          left: 110.w,
          child: SvgPicture.asset(AppSvgImages.authHomePeas),
        ),
        Positioned(
          top: 275.h,
          left: 105.w,
          child: Transform.rotate(
            angle: -0.2,
            child: SvgPicture.asset(AppSvgImages.authHomePeas),
          ),
        ),
      ],
    );
  }

  Positioned orangeVector() {
    return Positioned(
      top: 255.h,
      right: 105.w,
      child: SvgPicture.asset(AppSvgImages.authHomeOrange),
    );
  }

  Positioned meatVector() {
    return Positioned(
      top: 165.h,
      right: 50.w,
      child: SvgPicture.asset(AppSvgImages.authHomeMeat),
    );
  }

  Positioned eggVector() {
    return Positioned(
      top: 170.h,
      left: 80.w,
      child: SvgPicture.asset(AppSvgImages.authHomeEgg),
    );
  }

  Stack leafVectors() {
    return Stack(
      children: [
        Positioned(
          top: 153.h,
          left: 177.w,
          child: SvgPicture.asset(AppSvgImages.authHomeLeaf),
        ),
        Positioned(
          top: 183.h,
          right: 27.w,
          child: SvgPicture.asset(AppSvgImages.authHomeLeaf1),
        ),
        Positioned(
          top: 220.h,
          left: 55.w,
          child: SvgPicture.asset(AppSvgImages.authHomeLeaf2),
        ),
        Positioned(
          top: 290.h,
          left: 180.w,
          child: SvgPicture.asset(AppSvgImages.authHomeLeaf3),
        ),
        Positioned(
          top: 335.h,
          left: 40.w,
          child: SvgPicture.asset(AppSvgImages.authHomeLeaf4),
        ),
        Positioned(
          top: 385.h,
          right: 75.w,
          child: SvgPicture.asset(AppSvgImages.authHomeLeaf5),
        ),
      ],
    );
  }

  Stack bgDotVectors() {
    return Stack(
      children: [
        Positioned(
          top: 155.h,
          left: 35.w,
          child: SvgPicture.asset(
            AppSvgImages.authHomeIllustration,
            width: ScreenUtil().screenWidth - 70,
          ),
        ),
        Positioned(
          top: 225.h,
          left: 167.w,
          child: SvgPicture.asset(AppSvgImages.authHomeDot2),
        ),
        Positioned(
          top: 235.h,
          right: 110.w,
          child: SvgPicture.asset(AppSvgImages.authHomeDot3),
        ),
        Positioned(
          top: 360.h,
          left: 195.w,
          child: SvgPicture.asset(AppSvgImages.authHomeDot1),
        ),
      ],
    );
  }

  Positioned bgCurveVector() {
    return Positioned.fill(
      child: SvgPicture.asset(AppSvgImages.authHomeBgPattern),
    );
  }

  /// for svg vector animations
  Widget floatingVector({required Widget child, required double offsetY}) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: offsetY),
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
      builder: (context, value, _) {
        return Transform.translate(offset: Offset(0, value), child: child);
      },
      onEnd: () {
        setState(() {});
      },
    );
  }
}
