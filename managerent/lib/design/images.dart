import 'package:flutter_svg/flutter_svg.dart';
import 'package:managerent/design/colors.dart';

final SvgPicture backgroundImage = SvgPicture.asset('assets/images/back.svg');
final SvgPicture bascketImage = SvgPicture.asset('assets/images/bascket.svg');

final SvgPicture clipImage = SvgPicture.asset('assets/images/clip.svg');
final SvgPicture crossImage = SvgPicture.asset(
  'assets/images/cross.svg',
  width: 17.5,
  height: 17.5,
);

final SvgPicture folderImage = SvgPicture.asset(
  'assets/images/folder.svg',
  width: 26,
  height: 21.48,
);

final SvgPicture leftTopBackImage =
    SvgPicture.asset('assets/images/left_top.svg');
final SvgPicture pdfImage = SvgPicture.asset('assets/images/pdf.svg');
final SvgPicture pencilImage = SvgPicture.asset(
  'assets/images/pencil.svg',
  color: whiteColor,
  width: 17,
  height: 17,
);
final SvgPicture plusImage =
    SvgPicture.asset('assets/images/plus.svg', color: blackColor);
final SvgPicture rightBotBackImage =
    SvgPicture.asset('assets/images/right_bot.svg');

class NavigationBarImages {
  static final SvgPicture docBarImage =
      SvgPicture.asset('assets/images/doc_bar.svg');
  static final SvgPicture docBarImageSelect =
      SvgPicture.asset('assets/images/doc_bar_select.svg');
  static final SvgPicture statisticBarImage =
      SvgPicture.asset('assets/images/statistics_bar.svg');
  static final SvgPicture statisticBarImageSelect =
      SvgPicture.asset('assets/images/statistics_bar_select.svg');
  static final SvgPicture homeBarImage =
      SvgPicture.asset('assets/images/home_bar.svg');
  static final SvgPicture homeBarImageSelect =
      SvgPicture.asset('assets/images/home_bar_select.svg');
  static final SvgPicture clientBarImage =
      SvgPicture.asset('assets/images/client_bar.svg');
  static final SvgPicture clientBarImageSelect =
      SvgPicture.asset('assets/images/client_bar_select.svg');
}
