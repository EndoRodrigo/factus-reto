import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;


class StripeService {
  StripeService._();
  static final StripeService instance = StripeService._();

  Future<void> init() async {
    Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? "";
    await Stripe.instance.applySettings();
  }

  Future<bool> makePayment(double amount, String currency) async {
    try {
      final paymentIntentData = await _createPaymentIntent(
        (amount * 100).toInt().toString(),
        currency,
      );

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData['client_secret'],
          style: ThemeMode.dark,
          merchantDisplayName: 'Factus Retos Store',
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      
      return true;
    } catch (e) {
      debugPrint("Error Stripe: $e");
      return false;
    }
  }

  Future<Map<String, dynamic>> _createPaymentIntent(String amount, String currency) async {
    try {
      final String secretKey = dotenv.env['STRIPE_SECRET_KEY'] ?? "";
      
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return jsonDecode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
