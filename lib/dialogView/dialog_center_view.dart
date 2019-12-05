/*
 * @Author Bangjin Yu
 * @Email: 1227169416@qq.com
 * @Address: 梦想小镇互联网村
 * @Date 2019-12-04 17:07:57 Wednesday
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_uikit/ui_button.dart';
import 'package:flutter_uikit/ui_text.dart';

class DialogState {
  final String title;
  final String text;
  final String leftStr;
  final String rightStr;
  final double titleHeight;
  final double buttonHeight;
  final int titleColor;
  final int textColor;
  final int leftColor;
  final int rightColor;
  final double titleSize;
  final double textSize;
  final double buttonSize;

  final TextAlign textAlign;

  DialogState({
    this.title = '提示',
    @required this.text,
    this.leftStr = '取消',
    this.rightStr = '确认',
    this.titleHeight = 90,
    this.buttonHeight = 100,
    this.titleColor = 0xFF333333,
    this.textColor = 0xFF666666,
    this.leftColor = 0xFF666666,
    this.rightColor = 0xFF4AA3FF,
    this.titleSize = 36,
    this.textSize = 30,
    this.buttonSize = 32,
    this.textAlign = TextAlign.center
  });
}

class DialogCenterView extends StatefulWidget {
  final int color;
  final DialogState dialogState;
  final double width;
  final double height;
  const DialogCenterView({
    Key key,
    this.color = 0x51000000,
    @required this.dialogState,
    this.width = 560,
    this.height = 346,
  }) : super(key: key);
  _DialogCenterView createState() => new _DialogCenterView();
}

class _DialogCenterView extends State<DialogCenterView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    // TODO: implement build
    return new GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: new Scaffold(
        backgroundColor: Color(widget.color),
        body: new Center(
          child: new GestureDetector(
            onTap: () {},
            child: new Container(
              width: ScreenUtil.instance.setWidth(widget.width),
              height: ScreenUtil.instance.setWidth(widget.height),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: new Column(
                children: <Widget>[
                  _titleView(),
                  _textView(),
                  Divider(
                    height: 1,
                    color: Color(0xFFEAEAEA),
                  ),
                  _buttonView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleView() {
    return new Container(
      height: ScreenUtil.instance.setWidth(widget.dialogState.titleHeight),
      child: Center(
        child: UIText(
          data: widget.dialogState.title,
          color: widget.dialogState.titleColor,
          fontSize: ScreenUtil.instance.setSp(widget.dialogState.titleSize),
        ),
      ),
    );
  }

  Widget _textView() {
    return new Expanded(
      flex: 1,
      child: new Container(
        height: ScreenUtil.instance.setWidth(widget.dialogState.titleHeight),
        child: Center(
          child: UIText(
            textAlign: widget.dialogState.textAlign,
            data: widget.dialogState.text,
            color: widget.dialogState.textColor,
            fontSize: ScreenUtil.instance.setSp(widget.dialogState.textSize),
          ),
        ),
      ),
    );
  }

  Widget _buttonView() {
    return new Container(
      height: ScreenUtil.instance.setWidth(widget.dialogState.buttonHeight),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: _getLiftBtn(),
          ),
          new Container(
            width: 1,
            color: Color(0xFFEAEAEA),
          ),
          new Expanded(
            child: _getRightBtn(),
          ),
        ],
      ),
    );
  }

  Widget _getLiftBtn() {
    return UIButton(
      onPressed: () {
        Navigator.pop(context, false);
      },
      buttonState: new UIButtonState(title: widget.dialogState.leftStr),
      padding: EdgeInsets.symmetric(vertical: ScreenUtil.instance.setWidth(20)),
      color: 0xFFFFFFFF,
      child: new UIText(
        data: widget.dialogState.leftStr,
        color: widget.dialogState.leftColor,
        fontSize: ScreenUtil.instance.setSp(widget.dialogState.buttonSize),
      ),
    );
  }

  Widget _getRightBtn() {
    return UIButton(
      onPressed: () {
        Navigator.pop(context, true);
      },
      buttonState: new UIButtonState(title: widget.dialogState.rightStr),
      padding: EdgeInsets.symmetric(vertical: ScreenUtil.instance.setWidth(20)),
      color: 0xFFFFFFFF,
      child: new UIText(
        data: widget.dialogState.rightStr,
        color: widget.dialogState.rightColor,
        fontSize: ScreenUtil.instance.setSp(widget.dialogState.buttonSize),
      ),
    );
  }
}
