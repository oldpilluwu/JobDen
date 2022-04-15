import 'package:flutter/material.dart';
import 'package:job_den/models/user_account.dart';
import 'package:job_den/views/account/EditButton.dart';
import 'package:job_den/views/authentication/widgets/custom_text_field.dart';
import 'package:job_den/views/authentication/widgets/submit_button.dart';

import '../../commons/navigation_bar.dart';
import '../common_widgets/color_palette.dart';
import '../common_widgets/custom_app_bar.dart';
import '../common_widgets/generic_button.dart';
import 'info_to_field_switcher.dart';

class AccountDetailsScreen extends StatefulWidget {
  UserAccount userAccount;
  bool isEditable = false;
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  // Date add korte hobe
  final TextEditingController fieldController = TextEditingController();
  final TextEditingController instController = TextEditingController();
  final TextEditingController gradYearController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  AccountDetailsScreen({Key? key, required this.userAccount}) : super(key: key);
  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.backgroundColor,
        body: _buildContent(),
        bottomNavigationBar: AppNavigationBar(index: 4,),
        appBar: CustomAppBar(label: "Personal Details",)
    );
  }
  Widget _buildContent() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          controller: new ScrollController(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(flex: 4, child: Text("Email: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                  Expanded(flex: 8, child: Text(widget.userAccount.email, style: const TextStyle(fontSize: 18, color: ColorPalette.black),)),
                ],
              ),
              const SizedBox(height: 15,),
              InfoToFieldSwitcher(info: widget.userAccount.firstName,isEditable: widget.isEditable, controller: widget.fNameController, label: "First Name",),
              const SizedBox(height: 15,),
              InfoToFieldSwitcher(info: widget.userAccount.lastName,isEditable: widget.isEditable, controller: widget.lNameController, label: "Last Name",),
              const SizedBox(height: 15,),
              InfoToFieldSwitcher(info: widget.userAccount.dateOfBirth,isEditable: widget.isEditable, controller: widget.dobController, label: "Date of Birth",),
              const SizedBox(height: 15,),
              InfoToFieldSwitcher(info: widget.userAccount.fieldOfStudy,isEditable: widget.isEditable, controller: widget.fieldController, label: "Field of Study",),
              const SizedBox(height: 15,),
              InfoToFieldSwitcher(info: widget.userAccount.institution,isEditable: widget.isEditable, controller: widget.instController, label: "Institution",),
              const SizedBox(height: 15,),
              InfoToFieldSwitcher(info: widget.userAccount.graduationYear,isEditable: widget.isEditable, controller: widget.gradYearController, label: "Graduated",),
              const SizedBox(height: 15,),
              InfoToFieldSwitcher(info: widget.userAccount.address,isEditable: widget.isEditable, controller: widget.addressController, label: "Address",),
              const SizedBox(height: 15,),
              InfoToFieldSwitcher(info: widget.userAccount.phoneNumber,isEditable: widget.isEditable, controller: widget.phoneController, label: "Phone No.",),
              const SizedBox(height: 15,),
              widget.isEditable ?
              SubmitButton(onPressed: (){
                setState(() {
                  // Do Stuff
                  widget.isEditable = false;
                });
              }, text: "Save Edit")
                  :
              EditButton(onPressed: () {
                setState(() {
                  // Do Stuff
                  widget.isEditable = true;
                });
              })

            ],
          ),
        ),
      ),
    );
  }
}
