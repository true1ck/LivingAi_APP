import 'package:flutter/material.dart';
import 'package:livingai_app/ui/login/signup_screen.dart';
import 'package:livingai_app/ui/login/signin_screen.dart';


// Colors from Figma
const LightCream = Color(0xFFFFFBEB);
const LighterCream = Color(0xFFFEFCE8);
const LightestGreen = Color(0xFFF7FEE7);
const Maize = Color(0xFFF7C35F);
const TerraCotta = Color(0xFFD97D5D);
const DarkBrown = Color(0xFF5D4E37);
const MidBrown = Color(0xFF8B7355);
const DarkerBrown = Color(0xFF322410);
const DarkOrange = Color(0xFFE07A5F);
const Gold = Color(0xFFFFDD88);
const LightOrange = Color(0xFFFFB84D);

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
        child: Stack(
          children: [
            // Decorative elements (background)
            const _LoginBarn(),
            const _LoginFence(),
            const _LoginHayBales(),
            const _LoginCow(),
            const _LoginGoat(),
            const _LoginWheat(),
            const _LoginSun(),
            const _LoginClouds(),

            // Main content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const Spacer(flex: 1),

                  // Icon Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Gold,
                          borderRadius: BorderRadius.circular(28),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "🌾",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: LightOrange.withOpacity(0.72),
                          borderRadius: BorderRadius.circular(36),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "🌱",
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: DarkOrange.withOpacity(0.67),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "☀️",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  const Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: DarkBrown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Join the farm marketplace community",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: MidBrown,
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Sign up button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: LightOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        minimumSize: const Size.fromHeight(56),
                      ),
                      child: const Text(
                        "New user? Sign up",
                        style: TextStyle(
                          color: DarkerBrown,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(height: 16),

                  // Sign in button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignInScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TerraCotta,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        minimumSize: const Size.fromHeight(56),
                      ),
                      child: const Text(
                        "Already a user? Sign in",
                        style: TextStyle(
                          color: DarkerBrown,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Continue as Guest",
                    style: TextStyle(
                      color: MidBrown,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Spacer(flex: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Extracted decorative widgets to prevent unnecessary rebuilds

class _LoginBarn extends StatelessWidget {
  const _LoginBarn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 32,
      top: 80,
      child: Opacity(
        opacity: 0.15,
        child: Column(
          children: [
            Container(width: 80, height: 25),
            Container(
              width: 80,
              height: 112,
              decoration: BoxDecoration(
                color: const Color(0xFFC10007).withOpacity(0.6),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF7B3306).withOpacity(0.6),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LoginFence extends StatelessWidget {
  const _LoginFence({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      top: 686,
      child: Opacity(
        opacity: 0.20,
        child: SizedBox(
          width: 361,
          height: 38,
          child: Stack(
            children: [
              // rails
              Positioned(
                top: 18,
                left: 0,
                right: 0,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                      color: const Color(0xFF973C00).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Positioned(
                top: 32,
                left: 0,
                right: 0,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                      color: const Color(0xFF973C00).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              // posts
              Positioned.fill(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(10, (_) { // Increased from 6 to 10 for the larger width
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 8,
                          height: 38,
                          decoration: BoxDecoration(
                            color:
                            const Color(0xFF973C00).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginHayBales extends StatelessWidget {
  const _LoginHayBales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 241,
      top: 608,
      child: Opacity(
        opacity: 0.15,
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  width: 48,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color(0xFFD08700).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 48,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color(0xFFA65F00).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
            const SizedBox(width: 8),
            Container(
              width: 48,
              height: 40,
              margin: const EdgeInsets.only(top: 44),
              decoration: BoxDecoration(
                  color: const Color(0xFFD08700).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginCow extends StatelessWidget {
  const _LoginCow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 64,
      top: 568,
      child: Opacity(
        opacity: 0.12,
        child: Text("🐄", style: TextStyle(fontSize: 60)),
      ),
    );
  }
}

class _LoginGoat extends StatelessWidget {
  const _LoginGoat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 265,
      top: 160,
      child: Opacity(
        opacity: 0.10,
        child: Text("🐐", style: TextStyle(fontSize: 48)),
      ),
    );
  }
}

class _LoginWheat extends StatelessWidget {
  const _LoginWheat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 80,
      top: 732,
      child: Opacity(
        opacity: 0.15,
        child: Row(
          children: const [
            Text("🌾", style: TextStyle(fontSize: 36)),
            SizedBox(width: 4),
            Text("🌾", style: TextStyle(fontSize: 30)),
            SizedBox(width: 4),
            Text("🌾", style: TextStyle(fontSize: 36)),
          ],
        ),
      ),
    );
  }
}

class _LoginSun extends StatelessWidget {
  const _LoginSun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 281,
      top: 48,
      child: Opacity(
        opacity: 0.2,
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Gold.withOpacity(0.6),
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
  }
}

class _LoginClouds extends StatelessWidget {
  const _LoginClouds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 116,
      top: 112,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(width: 4),
          Container(
            width: 56,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(width: 4),
          Container(
            width: 40,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      ),
    );
  }
}
