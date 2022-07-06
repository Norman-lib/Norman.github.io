import 'package:flutter/material.dart';
import 'package:gwala/constants/assets.dart';
import 'package:gwala/constants/colors.dart';
import 'package:gwala/constants/text.dart';
import 'package:gwala/helpers/mails_manager.dart';
import 'package:gwala/helpers/mails_validator.dart';
import 'package:gwala/widgets/buttons.dart';
import 'package:lottie/lottie.dart';

String name = "";
String job = "";
String email = "";
String mailText = "";
String company = "";
final formKey = GlobalKey<FormState>();

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return DesktopContact(size: MediaQuery.of(context).size);
        } else {
          return const MinContact();
        }
      },
    );
  }
}

class MinContact extends StatefulWidget {
  const MinContact({Key? key}) : super(key: key);

  @override
  State<MinContact> createState() => _MinContactState();
}

class _MinContactState extends State<MinContact> {
  double lottieHeight = 0;
  double opacity = 1;
  String submitMessage = '';
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: screenHeight,
          width: screenWidth,
          color: AppColors.colorPalette['background'],
        ),
        Positioned(
            bottom: -300,
            child: Container(
              height: 700,
              width: 700,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colorPalette['secondary']),
            )),
        Positioned(
            bottom: -300,
            child: Container(
              height: 600,
              width: 600,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colorPalette['light']),
            )),
        AnimatedOpacity(
          opacity: 1 - opacity,
          duration: const Duration(milliseconds: 1500),
          child: Container(
            height: 0.9 * screenHeight,
            width: 0.9 * screenWidth,
            alignment: Alignment.center,
            color: Colors.transparent,
            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedSize(
                      duration: const Duration(milliseconds: 1000),
                      child: SizedBox(
                          height: lottieHeight,
                          child: Lottie.asset(
                            AppAssets.start,
                          )),
                    ),
                    ContactTextField(
                        inputTag: 'name',
                        hintText: '(*) Full Name',
                        width: 0.8 * screenWidth),
                    ContactTextField(
                        inputTag: 'jobTitle',
                        hintText: '(*) Job Title',
                        width: 0.8 * screenWidth),
                    ContactTextField(
                        hintText: 'Company',
                        width: 0.8 * screenWidth,
                        inputTag: 'company'),
                    ContactTextField(
                        hintText: '(*) Email adress',
                        width: 0.8 * screenWidth,
                        inputTag: 'email'),
                    ContactTextField(
                      inputTag: 'mailText',
                      width: 0.8 * screenWidth,
                      hintText: 'Your message here',
                      maxLines: 6,
                    ),
                    AppPrimaryButton(
                        content: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.check,
                                color: AppColors.colorPalette['dark'],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              'Submit',
                              textAlign: TextAlign.center,
                              style: AppTextStyle.buttonStyle,
                            ))
                          ],
                        ),
                        borderRadius: 15,
                        width: 130,
                        height: 50,
                        onClick: () {
                          if (formKey.currentState!.validate()) {
                            sendEmail();
                            setState(() {
                              submitMessage = 'Successfully Sent';
                            });
                          }
                        }),
                    Text(submitMessage),
                  ]),
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOutSine,
            width: 0.8 * screenWidth,
            height: 0.7 * screenHeight * opacity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.colorPalette['background'],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[500]!,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ]),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Make your company more fun to work for via Gwala',
                    style: AppTextStyle.titleStyle2,
                    textAlign: TextAlign.center,
                  ),
                  AppPrimaryButton(
                      content: const Text(
                        'Get Started',
                        style: TextStyle(color: Colors.black),
                      ),
                      borderRadius: 5,
                      width: 160,
                      height: 50,
                      onClick: () {
                        setState(() {
                          lottieHeight = 0.25 * screenHeight;
                          opacity = 0;
                        });
                      })
                ]),
          ),
        ),
      ],
    );
  }
}

class DesktopContact extends StatefulWidget {
  final Size size;
  const DesktopContact({Key? key, required this.size}) : super(key: key);

  @override
  State<DesktopContact> createState() => _DesktopContactState();
}

class _DesktopContactState extends State<DesktopContact> {
  late double firstCardLeft;
  late double ndCardLeft;
  late double firstCardWidth;
  double lottieHeight = 0;

  String submitMessage = '';

  @override
  void initState() {
    super.initState();
    firstCardLeft = 0.3 * widget.size.width;
    ndCardLeft = 0.4 * widget.size.width;
    firstCardWidth = 0.4 * widget.size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: AppColors.colorPalette['background'],
            )),
        Positioned(
            bottom: -150,
            right: -60,
            child: Container(
              width: 800,
              height: 800,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colorPalette['secondary']),
            )),
        Positioned(
            top: -20,
            left: -10,
            child: Container(
              width: 700,
              height: 700,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colorPalette['secondary']),
            )),
        Positioned(
            top: 0.15 * widget.size.height,
            left: 0.5 * widget.size.width,
            child: Container(
              height: 0.8 * widget.size.height,
              alignment: Alignment.center,
              color: Colors.transparent,
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ContactTextField(
                              inputTag: 'name',
                              hintText: '(*) Full Name',
                              width: 0.14 * widget.size.width),
                          SizedBox(
                            width: 0.02 * widget.size.width,
                          ),
                          ContactTextField(
                              inputTag: 'jobTitle',
                              hintText: '(*) Job Title',
                              width: 0.14 * widget.size.width),
                        ],
                      ),
                      ContactTextField(
                          hintText: 'Company',
                          width: 0.3 * widget.size.width,
                          inputTag: 'company'),
                      ContactTextField(
                          hintText: '(*) Email adress',
                          width: 0.3 * widget.size.width,
                          inputTag: 'email'),
                      ContactTextField(
                        inputTag: 'mailText',
                        width: 0.3 * widget.size.width,
                        hintText: 'Your message here',
                        maxLines: 6,
                      ),
                      AppPrimaryButton(
                          content: Row(
                            children: [
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: Icon(
                                  Icons.check,
                                  color: AppColors.colorPalette['dark'],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text(
                                'Submit',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.buttonStyle,
                              ))
                            ],
                          ),
                          borderRadius: 15,
                          width: 130,
                          height: 50,
                          onClick: () {
                            if (formKey.currentState!.validate()) {
                              sendEmail();
                              setState(() {
                                submitMessage = 'Successfully Sent';
                              });
                            }
                          }),
                      Text(submitMessage),
                    ]),
              ),
            )),
        Positioned(
            top: 0.15 * widget.size.height,
            bottom: 0.15 * widget.size.height,
            left: 0.15 * widget.size.width,
            child: Container(
              width: 0.3 * widget.size.width,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.colorPalette['background'],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[500]!,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedSize(
                      duration: const Duration(milliseconds: 700),
                      child: SizedBox(
                          height: 0.3 * widget.size.height,
                          child: Lottie.asset(
                            AppAssets.start,
                          )),
                    ),
                    Text(
                      'Make your company more fun to work for via Gwala',
                      style: AppTextStyle.titleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ]),
            )),
      ],
    );
  }
}

class ContactTextField extends StatefulWidget {
  final String inputTag;
  final double width;
  final int? maxLines;
  final String hintText;
  const ContactTextField(
      {Key? key,
      required this.width,
      this.maxLines,
      required this.hintText,
      required this.inputTag})
      : super(key: key);

  @override
  State<ContactTextField> createState() => _ContactTextFieldState();
}

class _ContactTextFieldState extends State<ContactTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: widget.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: AppColors.colorPalette['background'],
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500]!,
              offset: const Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ]),
      child: TextFormField(
        onChanged: (input) {
          setState(() {
            switch (widget.inputTag) {
              case 'name':
                name = input;
                break;
              case 'jobTitle':
                job = input;
                break;
              case 'company':
                company = input;
                break;
              case 'email':
                email = input;
                break;
              case 'mailText':
                mailText = input;
                break;
              default:
                break;
            }
          });
        },
        validator: (inputString) {
          switch (widget.inputTag) {
            case 'name':
              return Validator.nameValidator(inputString);
            case 'jobTitle':
              return Validator.jobTitleValidator(inputString);
            case 'email':
              return Validator.emailAdress(inputString);
            default:
              return null;
          }
        },
        maxLines: (widget.maxLines == null) ? 1 : widget.maxLines,
        textAlignVertical: TextAlignVertical.center,
        style: AppTextStyle.buttonStyle,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: AppTextStyle.buttonStyle,
            focusColor: Colors.amber),
      ),
    );
  }
}
