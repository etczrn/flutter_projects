import 'dart:convert';

import 'package:amazon_clone/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrHandle({
  required http.Response res,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (res.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      // 'msg' is from the server
      // .json({ msg: "User with same email already exists" });
      showSnackBar(context, jsonDecode(res.body)['msg']);
      break;
    case 500:
      // 'error' is from the server
      // res.status(500).json({ error: e.message });
      showSnackBar(context, jsonDecode(res.body)['error']);
      break;
    default:
      showSnackBar(context, res.body);
  }
}
