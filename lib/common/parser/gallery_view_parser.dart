class GalleryViewParser {
  // static Future<String> getImageUrl(String href) async {
  //   final HttpManager httpManager = HttpManager.getInstance();
  //
  //   final List<String> urlTemp = href.split('/');
  //
  //   final String url = 'https://e-hentai.org/lofi/s/' +
  //       urlTemp[urlTemp.length - 2] +
  //       '/' +
  //       urlTemp[urlTemp.length - 1];
  //
  //   final String cookie = Global.profile.user.cookie ?? '';
  //
  //   final Options options = Options(headers: {
  //     'Cookie': cookie,
  //   });
  //
  //   final String? response = await httpManager.get(
  //     url,
  //     options: options,
  //   );
  //
  //   final Document document = parse(response);
  //
  //   final Element? imageElem = document.querySelector('#sm');
  //   final String imageSrc = imageElem?.attributes['src'] ?? '';
  //
  //   logger.v(' $imageSrc');
  //
  //   return imageSrc;
  // }
}
