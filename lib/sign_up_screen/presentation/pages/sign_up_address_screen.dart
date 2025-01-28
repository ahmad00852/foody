import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Widgets/drop_down_widget.dart';
import 'package:form_filed_drop_down/form_filed_drop_down.dart';

import '../../../Widgets/text_feild.dart';
import '../../../const/const_color.dart';

class SignUpAddressScreen extends StatefulWidget {
  const SignUpAddressScreen({super.key});

  @override
  State<SignUpAddressScreen> createState() => _SignUpAddressScreenState();
}

class _SignUpAddressScreenState extends State<SignUpAddressScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController houseController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final formKey2 = GlobalKey<FormState>();
  final OverlayPortalController itemController = OverlayPortalController();
  List<String> cities = [
    'Aleppo',
    'Al-Ḥasakah',
    'Al-Qāmishlī',
    'Al-Qunayṭirah',
    'Al-Raqqah',
    'Al-Suwayda',
    'Damascus',
    'Darʿā',
    'Dayr al-Zawr',
    'Ḥamāh',
    'Homs',
    'Idlib',
    'Latakia',
    'Maʿlula',
    'Ṭarṭūs'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.verticalSpace,
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: ConstColor().mainColor,
                            borderRadius: BorderRadius.circular(4)),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    15.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Address',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                color: ConstColor().textColor)),
                        Text(
                          'Make sure it’s valid',
                          style: TextStyle(
                              fontSize: 18,
                              color: ConstColor().secondTextColor),
                        ),
                      ],
                    ),
                  ],
                ),
                58.verticalSpace,
                textFormFieldWidget(
                    textFormName: 'Phone No.',
                    validator: (value) {
                      if (value!.length >= 10 && value.contains('09')) {
                        return null;
                      } else {
                        return 'Enter A Valid Phone Number';
                      }
                    },
                    controller: phoneController,
                    hintText: 'Type your phone number'),
                16.verticalSpace,
                textFormFieldWidget(
                    textFormName: 'Address',
                    validator: (value) {
                      if (value != null) {
                        return null;
                      } else {
                        return 'Enter A Valid Address';
                      }
                    },
                    controller: addressController,
                    hintText: 'Type your address'),
                16.verticalSpace,
                textFormFieldWidget(
                    textFormName: 'House No.',
                    validator: (value) {
                      if (value != null) {
                        return null;
                      } else {
                        return 'Enter A Valid House Number';
                      }
                    },
                    controller: houseController,
                    hintText: 'Type your house number'),
                16.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text('City',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                5.verticalSpace,
                formFiledDropDownWidget(itemController: itemController, cities: cities),
                24.verticalSpace,
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpAddressScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ConstColor().mainColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Sign Up Now',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                  ),
                ),
                12.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
