import 'package:benfy/core/config/app_colors.dart';
import 'package:benfy/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IngredientCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const IngredientCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(26, 0, 0, 0),
            blurRadius: 15,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          // Ingredient Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 45.w,
              height: 40.h,
              decoration: BoxDecoration(color: AppColors.bgGreyColor),
              child: Image.asset(
                imagePath,
                width: 5.w,
                height: 4.h,
                // fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Ingredient Name
          Expanded(child: Text(name, style: AppTextStyle.cardTitle)),

          // Quantity Controls
          Row(
            children: [
              _QtyButton(
                icon: Icons.remove,
                onTap: onDecrement,
                color: quantity == 1
                    ? AppColors.bgGreyColor
                    : AppColors.appSecondaryColor.withValues(alpha: .5),
              ),
              const SizedBox(width: 8),
              Text(
                quantity.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              _QtyButton(
                icon: Icons.add,
                onTap: onIncrement,
                color: AppColors.appSecondaryColor.withValues(alpha: .5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  const _QtyButton({
    required this.icon,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 1.5.w),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16, color: Colors.black),
      ),
    );
  }
}
