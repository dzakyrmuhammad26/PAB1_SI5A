import 'package:flutter/material.dart';

class ProfileInfoItem extends StatelessWidget {
  // Variabel yang berbeda di setiap baris
  final IconData icon;
  final String label;
  final String value;
  final bool showEditIcon;
  final VoidCallback? onEditPressed;
  final Color iconColor;

  // Konstruktor dengan parameter bernama
  const ProfileInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.showEditIcon = false,
    this.onEditPressed,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 1/3 lebar layar untuk ikon dan label
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Row(
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        // Sisa lebar untuk nilai
        Expanded(child: Text(': $value', style: const TextStyle(fontSize: 18))),
        // Ikon edit hanya muncul jika showEditIcon = true
        if (showEditIcon)
          InkWell(onTap: onEditPressed, child: const Icon(Icons.edit)),
      ],
    );
  }
}
