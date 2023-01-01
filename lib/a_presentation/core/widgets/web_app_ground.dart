import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/measurements.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class WebAppGround extends StatelessWidget {
  const WebAppGround({required this.child, Key? key}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return isPhone(screenSize)
        ? child
        : Container(
            color: kPrimaryColors,
            width: screenSize.width,
            height: screenSize.height,
            alignment: AlignmentDirectional.center,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      width: screenWidth(screenSize),
                      height: screenHeight(screenSize),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        border: Border.all(),
                      ),
                      child: child,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  GestureDetector(
                    onTap: () => _launchURL(context),
                    child: RichText(
                      text: TextSpan(
                        text: 'Built with Passion by',
                        style: kSubheadStyle,
                        children: [
                          TextSpan(
                            text: 'Reem Almutairi',
                            style: kSubheadStyle.copyWith(
                              color: kPrimaryColors,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          );
  }

  Future<void> _launchURL(BuildContext context) async {
    const aBrainWebsiteUrl = 'https://reemnawaf.github.io/abrain';
    await canLaunch(aBrainWebsiteUrl)
        ? await launch(aBrainWebsiteUrl)
        : throw 'Could not launch $aBrainWebsiteUrl';
  }
}
