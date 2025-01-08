// import '../../generated/assets.gen.dart';

// class SocialsHelper {
//   const SocialsHelper();

//   String getContentType(String? contentType) {
//     return contentType?.toLowerCase() == 'story'
//         ? Assets.icon.story
//         : contentType?.toLowerCase() == "video"
//             ? Assets.icon.video
//             : contentType?.toLowerCase() == "slideshow"
//                 ? Assets.icon.slideshowPost
//                 : contentType?.toLowerCase() == 'image'
//                     ? Assets.icon.imagePost
//                     : Assets.icon.imagePost;
//   }

//   String getSocialIcon(String? platformName) {
//     return platformName?.toLowerCase() == 'instagram'
//         ? Assets.icon.instagramPurple
//         : (platformName?.toLowerCase() == 'twitter' ||
//                 platformName?.toLowerCase() == 'x')
//             ? Assets.icon.xPurple
//             : platformName?.toLowerCase() == 'tiktok'
//                 ? Assets.icon.tiktokPurple
//                 : platformName?.toLowerCase() == 'youtube'
//                     ? Assets.icon.youtubePurple
//                     : Assets.icon.close;
//   }

//   String getColoredSocialIcon(String? platformName) {
//     return platformName?.toLowerCase() == 'instagram'
//         ? Assets.icon.coloredInstagram
//         : (platformName?.toLowerCase() == 'twitter' ||
//                 platformName?.toLowerCase() == 'x')
//             ? Assets.icon.coloredX
//             : platformName?.toLowerCase() == 'tiktok'
//                 ? Assets.icon.coloredTiktok
//                 : platformName?.toLowerCase() == 'youtube'
//                     ? Assets.icon.coloredYoutube
//                     : Assets.icon.close;
//   }

//   String socialsURLBuilders(String? platform, String? accountName) {
//     switch (platform) {
//       case "instagram":
//         return "https://www.instagram.com/$accountName";
//       case "youtube":
//         return "https://www.youtube.com/user/$accountName";
//       case "twitter":
//         return "https://twitter.com/$accountName";
//       case "tiktok":
//         return "https://www.tiktok.com/@$accountName";
//       default:
//         return "";
//     }
//   }
// }

// // String getSocialIcon(String? platformName) {
// //   return platformName?.toLowerCase() == 'instagram'
// //       ? Assets.icon.instagramPurple
// //       : (platformName?.toLowerCase() == 'twitter' ||
// //               platformName?.toLowerCase() == 'x')
// //           ? Assets.icon.xPurple
// //           : platformName?.toLowerCase() == 'tiktok'
// //               ? Assets.icon.tiktokPurple
// //               : platformName?.toLowerCase() == 'youtube'
// //                   ? Assets.icon.youtubePurple
// //                   : Assets.icon.close;
// // }

// // String getColoredSocialIcon(String? platformName) {
// //   return platformName?.toLowerCase() == 'instagram'
// //       ? Assets.icon.coloredInstagram
// //       : (platformName?.toLowerCase() == 'twitter' ||
// //               platformName?.toLowerCase() == 'x')
// //           ? Assets.icon.coloredX
// //           : platformName?.toLowerCase() == 'tiktok'
// //               ? Assets.icon.coloredTiktok
// //               : platformName?.toLowerCase() == 'youtube'
// //                   ? Assets.icon.coloredYoutube
// //                   : Assets.icon.close;
// // }

// // String socialsURLBuilders(String? platform, String? accountName) {
// //   switch (platform) {
// //     case "instagram":
// //       return "https://www.instagram.com/$accountName";
// //     case "youtube":
// //       return "https://www.youtube.com/user/$accountName";
// //     case "twitter":
// //       return "https://twitter.com/$accountName";
// //     case "tiktok":
// //       return "https://www.tiktok.com/@$accountName";
// //     default:
// //       return "";
// //   }
// // }
