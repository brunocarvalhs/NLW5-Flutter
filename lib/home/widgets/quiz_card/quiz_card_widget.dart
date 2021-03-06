import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indication/progress_indication_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int finish;
  final int all;
  final VoidCallback onTap;
  QuizCardWidget({
    Key? key,
    required this.title,
    this.all = 10,
    this.finish = 0,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.border,
            ),
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                child: Image.asset(AppImages.blocks),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: AppTextStyles.heading15,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "$finish de $all",
                      style: AppTextStyles.body11,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ProgressIndicationWidget(
                      value: finish / all,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
