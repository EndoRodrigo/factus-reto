import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeService {
  StripeService._();
  static final StripeService instance = StripeService._();

  String _paymentIntentClientSecret = "";

  Future<void> init() async {
    Stripe.publishableKey = "TU_STRIPE_PUBLISHABLE_KEY"; // Reemplazar con tu llave
    await Stripe.instance.applySettings();
  }

  Future<bool> makePayment(double amount, String currency) async {
    try {
      // 1. Crear Payment Intent en el servidor (Mockup o tu endpoint)
      _paymentIntentClientSecret = await _createPaymentIntent(
        (amount * 100).toInt().toString(),
        currency,
      );

      // 2. Inicializar Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: _paymentIntentClientSecret,
          style: ThemeMode.dark,
          merchantDisplayName: 'Factus Retos Store',
        ),
      );

      // 3. Mostrar Payment Sheet
      await Stripe.instance.presentPaymentSheet();
      
      return true;
    } catch (e) {
      debugPrint("Error Stripe: $e");
      return false;
    }
  }

  Future<String> _createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer TU_STRIPE_SECRET_KEY', // Reemplazar con tu Secret Key
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return jsonDecode(response.body)['client_secret'];
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
