// import 'package:equatable/equatable.dart';
//
// class Media extends Equatable {
//   final String avatar;
//   final String passport;
//   final String idFront;
//   final String idBack;
//
//   const Media({required this.avatar, required this.passport, required this.idFront, required this.idBack});
//
//   @override
//   List<Object?> get props => [avatar, passport, idFront, idBack];
//
//   factory Media.fromJson(Map<String, dynamic> json) {
//     return Media(
//       avatar: json['avatar'],
//       passport: json['passport'],
//       idFront: json['id_front'],
//       idBack: json['id_back'],
//     );
//   }
// }
//
// class AddProfile extends Equatable {
//   final String id;
//   final String name;
//   final int userType;
//   final Media media;
//
//   const AddProfile({required this.id, required this.name, required this.userType, required this.media});
//
//   @override
//   List<Object?> get props => [id, name, userType, media];
//
//   factory AddProfile.fromJson(Map<String, dynamic> json) {
//     return AddProfile(
//       id: json['data']['id'],
//       name: json['data']['name'],
//       userType: json['data']['user_type'],
//       media: Media.fromJson(json['data']['media']),
//     );
//   }
//
//   @override
//   String toString() {
//     return 'AddProfile(id: $id, name: $name, userType: $userType, media: $media)';
//   }
//
// }
