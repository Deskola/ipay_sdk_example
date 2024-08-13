import 'dart:math';

import 'package:ipay_sdk_test/env_constants.dart';
import 'package:ipaycheckout/ipaycheckout.dart';

class HttpHelper {
  Future<String> generateUrl(
      String phoneNumber, String email, String amount) async {
    final ipay = IPay(
        vendorId: Configs.vendorId, vendorSecurityKey: Configs.securityKey);
    var oid = getRandomString(10);
    var inv = oid;
    var url = ipay.checkoutUrl(
        live: Configs.live,
        oid: oid,
        inv: inv,
        ttl: amount,
        tel: phoneNumber,
        eml: email,
        curr: Configs.currency,
        cbk: Configs.callBackUrl,
        cst: Configs.cst,
        crl: Configs.crl,
        mpesa: Configs.mpesa,
        bonga: Configs.bonga,
        airtel: Configs.airtel,
        equity: Configs.equity,
        mobilebanking: Configs.mobilebanking,
        creditcard: Configs.creditcard,
        mkoporahisi: Configs.mkoporahisi,
        saida: Configs.saida,
        elipa: Configs.elipa,
        unionpay: Configs.unionpay,
        mvisa: Configs.mvisa,
        vooma: Configs.vooma,
        pesalink: Configs.pesalink,
        autopay: Configs.autopay,
        recurring: Configs.recurring);

    return url;
  }

  String getRandomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    var newOid = String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    return newOid;
  }
}
