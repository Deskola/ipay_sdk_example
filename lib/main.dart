import 'package:flutter/material.dart';
import 'package:ipay_sdk_test/checkout_page.dart';
import 'package:ipay_sdk_test/http_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'iPay SDK'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  late final bool _isSubmitted = false;
  late HttpHelper helper;

  void checkout() async {
    final url = await helper.generateUrl(_phoneController.text, _emailController.text,
        _amountController.text);

    print(url);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CheckoutPage(url: url)));
  }

  @override
  void initState() {
    helper = HttpHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone number',
                      hintText: 'Enter Phone number'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter email'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Amount',
                    hintText: 'Enter amount',
                  ),
                ),
                const SizedBox(height: 10),
                _isSubmitted
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: checkout,
                        child: const Text('Checkout'),
                      ),
              ],
            ),
          ),
        ));
  }
}
