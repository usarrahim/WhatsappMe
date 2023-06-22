import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:whatsapp_me/common/extention/custom_theme_extentionumuz.dart';
import 'package:whatsapp_me/common/widgets/CustomIconButton.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  List<Widget> imageList = [];
  int currentPage = 0;
  int? lastPage;

  handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent <= .33) return;

    if (currentPage == lastPage) return;

    fetchAllImages();
  }

  fetchAllImages() async {
    lastPage = currentPage;
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) return PhotoManager.openSetting();

    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true,
    );

    List<AssetEntity> photos = await albums[0].getAssetListPaged(page: currentPage, size: 24);
    List<Widget> temp = [];

    for (var asset in photos) {
      temp.add(
        FutureBuilder(
          future: asset.thumbnailDataWithSize(ThumbnailSize(200, 200)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                  onTap: () => Navigator.pop(context, snapshot.data),
                  borderRadius: BorderRadius.circular(5),
                  splashFactory: NoSplash.splashFactory,
                  child: Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: context.theme.greyColor!.withOpacity(0.4), width: 1),
                      image: DecorationImage(
                        image: MemoryImage(snapshot.data as Uint8List),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }

            return SizedBox();
          },
        ),
      );
    }
    setState(() {
      imageList.addAll(temp);
      currentPage++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchAllImages();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: CustomIconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icons.arrow_back,
          iconColor: context.theme.greyColor,
        ),
        title: Text(
          'WhatsApp',
          style: TextStyle(color: context.theme.authAppbarTextColor),
        ),
        actions: [
          CustomIconButton(
            onPressed: () {},
            icon: Icons.more_vert,
            iconColor: context.theme.greyColor,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scroll) {
            handleScrollEvent(scroll);
            return true;
          },
          child: GridView.builder(
            itemCount: imageList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (_, index) {
              return imageList[index];
            },
          ),
        ),
      ),
    );
  }
}
