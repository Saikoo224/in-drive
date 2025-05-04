import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class RatingFeedbackScreen extends StatefulWidget {
  const RatingFeedbackScreen({Key? key}) : super(key: key);

  @override
  _RatingFeedbackScreenState createState() => _RatingFeedbackScreenState();
}

class _RatingFeedbackScreenState extends State<RatingFeedbackScreen> {
  double _rating = 0;
  final List<String> _quickFeedback = [];
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تقييم الرحلة', style: AppStyles.titleStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppStyles.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'كيف كانت تجربتك؟',
              style: AppStyles.headingStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppStyles.largePadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: AppStyles.accentColor,
                    size: AppStyles.largeIconSize,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: AppStyles.extraLargePadding),
            const Text(
              'تقييم سريع',
              style: AppStyles.titleStyle,
            ),
            const SizedBox(height: AppStyles.defaultPadding),
            Wrap(
              spacing: AppStyles.smallPadding,
              children: [
                'سائق محترف',
                'رحلة مريحة',
                'توصيل سريع',
                'سيارة نظيفة',
                'خدمة ممتازة',
              ].map((feedback) {
                return FilterChip(
                  label: Text(feedback),
                  selected: _quickFeedback.contains(feedback),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _quickFeedback.add(feedback);
                      } else {
                        _quickFeedback.remove(feedback);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: AppStyles.extraLargePadding),
            TextField(
              controller: _commentController,
              maxLines: 4,
              decoration: AppStyles.inputDecoration(
                labelText: 'اكتب تعليقك هنا...',
                hintText: 'شاركنا بتجربتك...',
              ),
            ),
            const SizedBox(height: AppStyles.extraLargePadding),
            ElevatedButton(
              onPressed: () {
                // Handle rating submission
                Navigator.pop(context);
              },
              style: AppStyles.primaryButtonStyle,
              child: const Text('إرسال التقييم', style: AppStyles.buttonTextStyle),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
