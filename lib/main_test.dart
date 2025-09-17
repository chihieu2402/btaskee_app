import 'package:flutter/material.dart';
import 'design_tokens/tokens.dart';
import 'components/button.dart';
import 'components//card.dart';
import 'components//input_field.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uber Style UI Demo',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const DemoPage(),
    );
  }
}
class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uber Style UI Components'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Buttons', style: AppTextStyles.heading),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              children: [
                AppButton(label: 'Primary', onPressed: () {}),
                AppButton(
                  label: 'Secondary',
                  onPressed: () {},
                  variant: ButtonVariant.secondary,
                ),
                AppButton(
                  label: 'Outline',
                  onPressed: () {},
                  variant: ButtonVariant.outline,
                ),
                AppButton(label: 'Disabled', onPressed: null),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Text('Card', style: AppTextStyles.heading),
            const SizedBox(height: AppSpacing.sm),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('This is a card title', style: AppTextStyles.heading),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Cards can contain content and actions about a single subject.',
                    style: AppTextStyles.body,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text('Input Field', style: AppTextStyles.heading),
            const SizedBox(height: AppSpacing.sm),
            AppInputField(
              controller: _controller,
              hintText: 'Enter your text here...',
            ),
            const SizedBox(height: AppSpacing.sm),
            AppInputField(
              controller: TextEditingController(),
              hintText: 'Disabled field',
              isDisabled: true,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppInputField(
              controller: TextEditingController(),
              hintText: 'Error field',
              isError: true,
            ),
          ],
        ),
      ),
    );
  }
}