import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class SealedSample extends StatelessWidget {
  SealedSample({Key? key}) : super(key: key);

  /// 返り値とか引数みたいな
  final Result<String> result = Success('Success');
  // final Result<String> result = Error(Exception('exception'));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        /// スッキリ書ける
        result.when(
          (value) => value,
          (error) => error.toString(),
        ),
      ),
    );
  }
}
