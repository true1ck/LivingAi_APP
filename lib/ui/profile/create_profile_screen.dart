import 'package:flutter/material.dart';

// Reusing colors from existing screens
const LightCream = Color(0xFFFFFBEB);
const LighterCream = Color(0xFFFEFCE8);
const LightestGreen = Color(0xFFF7FEE7);
const DarkText = Color(0xFF364153);
const MutedText = Color(0xFF4A5565);

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [LightCream, LighterCream, LightestGreen],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18),
                const Text(
                  "Create profile",
                  style: TextStyle(
                    fontSize: 16,
                    color: DarkText,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 60),

                const Center(
                  child: Text(
                    "Create Profile",
                    style: TextStyle(
                      fontSize: 32,
                      color: DarkText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    "Choose Profile Type",
                    style: TextStyle(fontSize: 18, color: MutedText),
                  ),
                ),

                const SizedBox(height: 48),

                // Profile type selection buttons
                _ProfileTypeButton(
                  icon: Icons.storefront, // Placeholder icon
                  text: "I'm a Seller",
                  color: Colors.purple.shade300,
                  onTap: () { /* TODO: Handle Seller selection */ },
                ),
                const SizedBox(height: 20),
                _ProfileTypeButton(
                  icon: Icons.shopping_bag_outlined, // Placeholder icon
                  text: "I'm a Buyer",
                  color: Colors.blue.shade400,
                  onTap: () { /* TODO: Handle Buyer selection */ },
                ),
                const SizedBox(height: 20),
                _ProfileTypeButton(
                  icon: Icons.build_outlined, // Placeholder icon
                  text: "I'm a Service Provider",
                  color: Colors.orange.shade600,
                  onTap: () { /* TODO: Handle Service Provider selection */ },
                ),
                const SizedBox(height: 20),
                _ProfileTypeButton(
                  icon: Icons.store_mall_directory_outlined, // Placeholder icon
                  text: "I'm a Mandi Host",
                  color: Colors.green.shade400,
                  onTap: () { /* TODO: Handle Mandi Host selection */ },
                ),

                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// A reusable button for the profile types
class _ProfileTypeButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback onTap;

  const _ProfileTypeButton({required this.icon, required this.text, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, 
                blurRadius: 2,
                offset: Offset(0, 1))
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: DarkText,
              ),
            ),
            const Spacer(),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
