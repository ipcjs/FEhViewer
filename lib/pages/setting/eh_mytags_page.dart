import 'package:fehviewer/common/service/layout_service.dart';
import 'package:fehviewer/common/service/theme_service.dart';
import 'package:fehviewer/network/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../component/setting_base.dart';
import '../../fehviewer.dart';
import 'const.dart';
import 'controller/eh_mytags_controller.dart';
import 'setting_items/selector_Item.dart';
import 'webview/mytags_in.dart';

class EhMyTagsPage extends GetView<EhMyTagsController> {
  const EhMyTagsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CupertinoPageScaffold(
        backgroundColor: !ehTheme.isDarkMode
            ? CupertinoColors.secondarySystemBackground
            : null,
        navigationBar: CupertinoNavigationBar(
            padding: const EdgeInsetsDirectional.only(end: 8),
            middle: Text(L10n.of(context).ehentai_my_tags),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  minSize: 40,
                  child: const Icon(
                    LineIcons.globeWithAmericasShown,
                    size: 24,
                  ),
                  onPressed: () async {
                    Get.to(() => InWebMyTags());
                  },
                ),
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  minSize: 40,
                  child: const Icon(
                    LineIcons.plus,
                    size: 24,
                  ),
                  onPressed: () async {
                    // Get.to(() => InWebMyTags());
                  },
                ),
              ],
            )),
        child: SafeArea(
          child: controller.obx(
            (state) {
              if (state == null) {
                return const SizedBox.shrink();
              }
              return CustomScrollView(
                slivers: [
                  EhCupertinoSliverRefreshControl(
                    onRefresh: controller.reloadData,
                  ),
                  SliverSafeArea(
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final e = state[index];

                          return SelectorSettingItem(
                            title: e.name,
                            onTap: () async {
                              if (controller.currSelected != e.value) {
                                controller.currSelected = e.value ?? '';
                                // await controller.reloadData();
                              }
                              Get.toNamed(
                                EHRoutes.userTags,
                                id: isLayoutLarge ? 2 : null,
                              );
                            },
                          );
                          // return _list[index];
                        },
                        childCount: state.length,
                      ),
                    ),
                  ),
                ],
              );
            },
            onLoading: const Center(
              child: CupertinoActivityIndicator(
                radius: 16,
              ),
            ),
            onEmpty: CustomScrollView(
              slivers: [
                EhCupertinoSliverRefreshControl(
                  onRefresh: controller.reloadData,
                ),
              ],
            ),
          ),
        ),
      );
    });

    return Obx(() {
      return CupertinoPageScaffold(
        backgroundColor: !ehTheme.isDarkMode
            ? CupertinoColors.secondarySystemBackground
            : null,
        navigationBar: CupertinoNavigationBar(
            padding: const EdgeInsetsDirectional.only(end: 8),
            middle: Text(L10n.of(context).ehentai_my_tags),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  minSize: 40,
                  child: const Icon(
                    LineIcons.globeWithAmericasShown,
                    size: 24,
                  ),
                  onPressed: () async {
                    Get.to(() => InWebMyTags());
                  },
                ),
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  minSize: 40,
                  child: const Icon(
                    LineIcons.plus,
                    size: 24,
                  ),
                  onPressed: () async {
                    // Get.to(() => InWebMyTags());
                  },
                ),
              ],
            )),
        child: CustomScrollView(
          slivers: [
            // EhCupertinoSliverRefreshControl(
            //   onRefresh: controller.reloadData,
            // ),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (context, index) {
            //       final e = _ehMyTagsController.ehMyTags.tagsets[index];
            //
            //       return SelectorSettingItem(
            //         title: e.name,
            //         onTap: () async {
            //           if (controller.currSelected != e.value) {
            //             controller.currSelected = e.value ?? '';
            //             // await controller.reloadData();
            //           }
            //           Get.toNamed(
            //             EHRoutes.userTags,
            //             id: isLayoutLarge ? 2 : null,
            //           );
            //         },
            //       );
            //       // return _list[index];
            //     },
            //     childCount: _ehMyTagsController.ehMyTags.tagsets.length,
            //   ),
            // ),
            controller.obx(
              (List<EhMytagSet>? state) {
                return Text('AAA');
              },
            )
            // controller.obx(
            //   (List<EhMytagSet>? state) {
            //     if (state == null) {
            //       return const SliverToBoxAdapter(
            //           child: SizedBox.shrink());
            //     }
            //     return SliverList(
            //       delegate: SliverChildBuilderDelegate(
            //         (context, index) {
            //           final e = state[index];
            //
            //           return SelectorSettingItem(
            //             title: e.name,
            //             onTap: () async {
            //               if (controller.currSelected != e.value) {
            //                 controller.currSelected = e.value ?? '';
            //                 // await controller.reloadData();
            //               }
            //               Get.toNamed(
            //                 EHRoutes.userTags,
            //                 id: isLayoutLarge ? 2 : null,
            //               );
            //             },
            //           );
            //           // return _list[index];
            //         },
            //         childCount: state.length,
            //       ),
            //     );
            //   },
            //   onEmpty: const SliverToBoxAdapter(
            //     child: CupertinoActivityIndicator(),
            //   ),
            // ),
          ],
        ),
      );
    });
  }
}
