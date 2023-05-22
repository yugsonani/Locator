import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'globel.dart';

class webpage extends StatefulWidget {
  const webpage({Key? key}) : super(key: key);

  @override
  State<webpage> createState() => _webpageState();
}

class _webpageState extends State<webpage> {
  InAppWebViewController? inAppWebViewController;
  late PullToRefreshController pullToRefreshController;

  List allBookmarks = [];

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
        options: PullToRefreshOptions(color: Colors.blue),
        onRefresh: () async {
          if (Platform.isAndroid) {
            await inAppWebViewController!.reload();
          } else if (Platform.isIOS) {
            await inAppWebViewController!.loadUrl(
                urlRequest: URLRequest(
              url: await inAppWebViewController!.getUrl(),
            ));
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    Map data1 = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text('${data1['Headquarters']}'),
        //  centerTitle: true,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse("${Globel.val}"),
        ),
        onWebViewCreated: (val) {
          inAppWebViewController = val;
        },
        pullToRefreshController: pullToRefreshController,
        onLoadStop: (controller, uri) async {
          await pullToRefreshController.endRefreshing();
        },
      ),
    );
  }
}
