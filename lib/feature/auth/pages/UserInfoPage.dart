import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_me/common/extention/custom_theme_extentionumuz.dart';
import 'package:whatsapp_me/common/helper/show_alert_dialog.dart';
import 'package:whatsapp_me/common/utils/Coloors.dart';
import 'package:whatsapp_me/common/widgets/CustomIconButton.dart';
import 'package:whatsapp_me/common/widgets/CustumElevatedButton.dart';
import 'package:whatsapp_me/common/widgets/short_h_bar.dart';
import 'package:whatsapp_me/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_me/feature/auth/pages/image_picker_page.dart';
import 'package:whatsapp_me/feature/auth/widgets/customTextField.dart';

class UserInfoPage extends ConsumerStatefulWidget {
  const UserInfoPage({super.key});

  @override
  ConsumerState<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends ConsumerState<UserInfoPage> {
  File? imageCamera;
  Uint8List? imageGalery;
  late TextEditingController usernameController;

  saveUserDataToFirebase() async {
    String username = usernameController.text;
    if (username.isEmpty) {
      return showAlertDialog(context: context, message: 'Please provide a username', btnText: 'OK');
    } else if (username.length < 3 || username.length > 20) {
      return showAlertDialog(
        context: context,
        message: 'A username length should be between 3-20',
        btnText: 'OK',
      );
    }

    ref.read(authControllerProvider).saveUserInfoToFireStore(
          username: username,
          profileImage: imageCamera ?? imageGalery ?? '',
          context: context,
          mounted: mounted,
        );
  }

  imagePickerTypeBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShortHBar(),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  'Profile photo',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: context.theme.greyColor,
                  ),
                ),
                Spacer(),
                CustomIconButton(onPressed: () => Navigator.pop(context), icon: Icons.close),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            Divider(color: context.theme.greyColor!.withOpacity(0.3)),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                imagePickerIcon(onTap: () => pickImageFromCamera(), iconData: Icons.camera_alt_rounded, text: 'Camera'),
                SizedBox(
                  width: 15,
                ),
                imagePickerIcon(
                    onTap: () async {
                      Navigator.pop(context);
                      final image = await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ImagePickerPage(),
                      ));
                      if (image == null) return;
                      setState(() {
                        imageGalery = image;
                        imageCamera = null;
                      });
                    },
                    iconData: Icons.photo_camera_back_rounded,
                    text: 'Gallery'),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        );
      },
    );
  }

  pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        imageCamera = File(image!.path);
        imageGalery = null;
      });
    } catch (e) {
      showAlertDialog(context: context, message: e.toString(), btnText: 'OK');
    }
  }

  imagePickerIcon({
    required VoidCallback onTap,
    required IconData iconData,
    required String text,
  }) {
    return Column(
      children: [
        CustomIconButton(
          onPressed: onTap,
          icon: iconData,
          iconColor: Coloors.greenDark,
          minWidth: 50,
          border: Border.all(width: 1, color: context.theme.greyColor!.withOpacity(.2)),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(color: context.theme.greyColor),
        )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    usernameController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          'Profile Info',
          style: TextStyle(color: context.theme.authAppbarTextColor),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              'Please provide your  name and an optional profile photo.',
              style: TextStyle(
                color: context.theme.greyColor,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () => imagePickerTypeBottomSheet(),
              child: Container(
                padding: EdgeInsets.all(26),
                decoration: BoxDecoration(
                  image: imageCamera != null || imageGalery != null
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: imageGalery != null ? MemoryImage(imageGalery!) as ImageProvider : FileImage(imageCamera!),
                        )
                      : null,
                  border: Border.all(
                    color: imageCamera == null && imageGalery == null ? Colors.transparent : context.theme.greyColor!.withOpacity(0.4),
                  ),
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3, right: 3),
                  child: Icon(
                    Icons.add_a_photo_rounded,
                    color: imageCamera == null && imageGalery == null ? context.theme.photoIconColor : Colors.transparent,
                    size: 48,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: CustomTextField(
                  controller: usernameController,
                  hintText: 'Type your name here. ',
                  textAlign: TextAlign.left,
                  AutoFocus: true,
                )),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: context.theme.photoIconColor,
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPress: () => saveUserDataToFirebase(),
        text: 'NEXT',
        weight: 90,
      ),
    );
  }
}
