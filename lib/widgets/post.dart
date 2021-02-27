import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/constants/common_size.dart';
import 'package:test_flutter/constants/screen_size.dart';
import 'package:test_flutter/widgets/my_progress_indicator.dart';
import 'package:test_flutter/widgets/rounded_avatar.dart';

import 'comment.dart';

class Post extends StatelessWidget {
  final int number;

  Post(
    this.number, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _postHeader(),
        _postImage(),
        _postActions(),
        _postLikes(),
        _postCaption(),
      ],
    );
  }

  Padding _postLikes() {
    return Padding(
        padding: const EdgeInsets.only(left: common_gap),
        child: Text('12000 likes' , style: TextStyle(fontWeight: FontWeight.bold),),
      );
  }

  Row _postActions() {
    return Row(
        children: <Widget>[
          IconButton(
              icon: ImageIcon(AssetImage('assets/images/bookmark.png') , color: Colors.black87,),
              onPressed: null),
          IconButton(
              icon: ImageIcon(AssetImage('assets/images/comment.png') , color: Colors.black87,),
              onPressed: null),
          IconButton(
              icon: ImageIcon(AssetImage('assets/images/direct_message.png') , color: Colors.black87,),
              onPressed: null),
          Spacer(),
          IconButton(
              icon: ImageIcon(AssetImage('assets/images/heart_selected.png') , color: Colors.black87,),
              onPressed: null)
        ],
      );
  }

  Widget _postHeader() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(common_xxs_gap),
          child: RoundedAvatar(),
        ),
        Expanded(child: Text('userName')),
        IconButton(icon: Icon(Icons.more_horiz , color: Colors.black87,), onPressed: null)
      ],
    );
  }

  CachedNetworkImage _postImage() {
    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$number/2000/300',
      placeholder: (BuildContext context, String url) {
        return MyProgressIndicator(containerSize: size.width, progressSize: 50);
      },
      imageBuilder: (BuildContext context, ImageProvider imageProvider) {
        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          ),
        );
      },
    );
  }

  Widget _postCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap , vertical: common_xxs_gap),
      child: Comment(showImage: true, text: 'testtestetset', username: 'user test1',),
    );
  }
}


