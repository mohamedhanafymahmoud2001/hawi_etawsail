import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/generated/assets.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/view/myOrders/detailsOrder/containerdetails.dart';
import 'package:provider/provider.dart';

class EditProfileView extends StatelessWidget {
  ColorsApp colorsApp = new ColorsApp();

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Image.asset(Assets.imagesLogo),
            elevation: 0,
            backgroundColor: colorsApp.colorbody,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 1, color: Colors.grey.shade200),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(Assets.imagesProfileShap2),
                          Image.asset(Assets.imagesProfileShap1),
                        ],
                      ),
                      Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 1, color: Colors.grey.shade200),
                                ),
                                child: val.imageFileProfileEdite == null
                                    ? val.profile == null
                                        ? Icon(
                                            Icons.person_2_outlined,
                                            color: Colors.grey,
                                          )
                                        : val.profile['data']['image'] == null
                                            ? Icon(
                                                Icons.person_2_outlined,
                                                color: Colors.grey,
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.network(
                                                  "${val.api.ip}/${val.profile['data']['image']}",
                                                  fit: BoxFit.cover,
                                                ))
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.file(
                                          val.imageFileProfileEdite!,
                                          fit: BoxFit.cover,
                                        )),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 1, color: Colors.grey.shade200),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    val.uploadImageProfileEdite();
                                  },
                                  icon: SvgPicture.asset(
                                    Assets.imagesEdit,
                                    width: 16,
                                    height: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "تعديل بيانات الحساب",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _buildTextField(
                                  val.api.f_name_ed, "الاسم الاول", false),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: _buildTextField(
                                  val.api.l_name_ed, "الاسم الثاني:", false),
                            ),
                          ],
                        ),
                        _buildTextField(val.api.phone_ed, "رقم الهاتف:", false),
                        _buildTextField(
                            val.api.pass_old_ed, "كلمة المرور السابقة:", true),
                        _buildTextField(
                            val.api.pass_new_ed, "كلمة المرور الجديدة:", true),
                        _buildTextField(
                            val.api.pass_conf_ed, "تأكيد كلمة المرور:", true),
                        const SizedBox(height: 30),
                        MaterialButton(
                          onPressed: () {
                            val.UpdateProfile();
                            dialogApp.checkdialog(context, () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            });
                          },
                          minWidth: 100,
                          height: 45,
                          color: colorsApp.colorblackApp,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            "التالي",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: colorsApp.colorbody,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildTextField(
      TextEditingController controller, String label, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[700]),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      ),
    );
  }
}
