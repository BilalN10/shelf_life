import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

class QrCodeScannerPage extends StatefulWidget {
  const QrCodeScannerPage({super.key});

  @override
  State<QrCodeScannerPage> createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends State<QrCodeScannerPage> {
  bool isScan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECECEC),
      body: SizedBox(
        height: Adaptive.h(100),
        width: Adaptive.w(100),
        child: Padding(
          padding: EdgeInsets.only(
              left: Adaptive.px(10),
              right: Adaptive.px(10),
              top: Adaptive.px(30)),
          child: Column(
            children: [
              Row(
                children: [
                  CustomBackButton(),
                  const Spacer(),
                  Text(
                    'Scan EAN',
                    style: GoogleFonts.poppins(
                        fontSize: Adaptive.px(16), fontWeight: FontWeight.w600),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
              SizedBox(
                height: Adaptive.h(2),
              ),
              Container(
                width: Adaptive.w(100),
                height: Adaptive.px(319),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: isScan
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BarcodeWidget(
                            barcode: Barcode.code128(),
                            data: '123',
                            width: 200,
                            height: 150,
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(IconClass.scan),
                          SizedBox(
                            height: Adaptive.px(15),
                          ),
                          Text(
                            'Scan or upload a photo of\nyour license',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: Adaptive.px(14),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
              ),
              SizedBox(
                height: Adaptive.px(45),
              ),
              PrimaryButton(
                  onTap: () {
                    setState(() {
                      isScan = !isScan;
                    });
                  },
                  text: 'Continue'),
              SizedBox(
                height: Adaptive.px(15),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: Adaptive.px(60),
                  width: Adaptive.w(100),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF1F1F1)),
                  child: Center(
                    child: Text(
                      'Retake Photo',
                      style: GoogleFonts.poppins(
                          color: const Color(0xff666666),
                          fontSize: Adaptive.px(16),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
