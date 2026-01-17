import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeService {
  StripeService._();
  static final StripeService instance = StripeService._();

  Future<void> init() async {
    Stripe.publishableKey = "pk_test_51SqP4zDAz15rcIgtd3sbdObSnjFCk6Rtv8w1jX5Ywas0IDQTruyFxNxt4XsuQNCpwCeFlWwKK14CRXHwAcdlWxL400hkLxu5rT"; // Reemplazar con tu llave real
    await Stripe.instance.applySettings();
  }

  Future<bool> makePayment(double amount, String currency) async {
    try {
      // 1. Crear Payment Intent
      final paymentIntentData = await _createPaymentIntent(
        (amount * 100).toInt().toString(),
        currency,
      );

      // 2. Inicializar Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData['client_secret'],
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

  Future<Map<String, dynamic>> _createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer sk_test_51SqP4zDAz15rcIgtCH1yy0BjsXOISvidcAj0YO6yRZp4T0hIzxBqBEWqFmf2HnT95S0p9QjY4wNyDswm9aWREVAV00uzoogpB1', // Reemplazar con tu Secret Key real
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
