import 'package:flutter/material.dart';

// Colors from your design
const LightCream = Color(0xFFFFFBEB);
const LighterCream = Color(0xFFFEFCE8);
const LightestGreen = Color(0xFFF7FEE7);
const AccentOrange = Color(0xFFFE9A00);
const BrandOrange = Color(0xFFE17100);
const DarkText = Color(0xFF364153);
const MutedText = Color(0xFF4A5565);

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [LightCream, LighterCream, LightestGreen],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            const _Barn(),
            const _Fence(),
            const _HayBales(),
            const _Cow(),
            const _Goat(),
            const _Wheat(),
            const _Sun(),
            const _Clouds(),

            // Main content (scrollable)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 16,
                        color: DarkText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 48),

                    // Branding centered
                    Center(
                      child: Column(
                        children: const [
                          Text(
                            "Farm",
                            style: TextStyle(
                              fontSize: 32,
                              color: BrandOrange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Market",
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Find your perfect livestock",
                            style: TextStyle(fontSize: 16, color: MutedText),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 48),

                    const Text(
                      "Enter Number",
                      style: TextStyle(
                        fontSize: 16,
                        color: DarkText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Phone input with country code
                    Row(
                      children: [
                        // country code box
                        Container(
                          width: 65,
                          height: 52,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              )
                            ],
                            border: Border.all(
                              color: Colors.black.withOpacity(0.07),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "+91",
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ),
                        const SizedBox(width: 6),

                        // phone number field
                        Expanded(
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 1,
                                    offset: Offset(0, 1))
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                const Icon(Icons.phone, size: 18, color: Color(0xFF99A1AF)),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextField(
                                    controller: _phoneController,
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter your Phone Number",
                                      hintStyle:
                                      TextStyle(color: Color(0xFF99A1AF), fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Sign Up button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: implement sign up logic
                          final phone = _phoneController.text.trim();
                          // basic validation
                          if (phone.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please enter phone number")),
                            );
                            return;
                          }
                          // navigate / call API
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AccentOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // already have account
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(fontSize: 16, color: MutedText),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              // TODO: navigate to Sign in
                            },
                            child: const Text(
                              "Sign in",
                              style: TextStyle(
                                fontSize: 16,
                                color: BrandOrange,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    // push content up so decorative bottom elements show
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Extracted decorative widgets to prevent unnecessary rebuilds

class _Barn extends StatelessWidget {
  const _Barn({Key? key}) : super(key: key);

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

class _Fence extends StatelessWidget {
  const _Fence({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Positioned(
      left: 16,
      top: media.height - 160,
      child: Opacity(
        opacity: 0.20,
        child: SizedBox(
          width: media.width - 32,
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
                  children: List.generate(6, (_) {
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

class _HayBales extends StatelessWidget {
  const _HayBales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Positioned(
      left: media.width * 0.6,
      top: media.height * 0.73,
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

class _Cow extends StatelessWidget {
  const _Cow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Positioned(
      left: 64,
      top: media.height * 0.75,
      child: const Opacity(
        opacity: 0.12,
        child: Text("🐄", style: TextStyle(fontSize: 60)),
      ),
    );
  }
}

class _Goat extends StatelessWidget {
  const _Goat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Positioned(
      left: media.width * 0.7,
      top: media.height * 0.18,
      child: const Opacity(
        opacity: 0.10,
        child: Text("🐐", style: TextStyle(fontSize: 48)),
      ),
    );
  }
}

class _Wheat extends StatelessWidget {
  const _Wheat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Positioned(
      left: 80,
      top: media.height * 0.9,
      child: Opacity(
        opacity: 0.15,
        child: Row(
          children: const [
            Text("🌾", style: TextStyle(fontSize: 36)),
            SizedBox(width: 8),
            Text("🌾", style: TextStyle(fontSize: 30)),
            SizedBox(width: 8),
            Text("🌾", style: TextStyle(fontSize: 36)),
          ],
        ),
      ),
    );
  }
}

class _Sun extends StatelessWidget {
  const _Sun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Positioned(
      left: media.width * 0.72,
      top: 48,
      child: Opacity(
        opacity: 0.2,
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: const Color(0xFFFDC700).withOpacity(0.6),
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
  }
}

class _Clouds extends StatelessWidget {
  const _Clouds({Key? key}) : super(key: key);

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
                borderRadius: BorderRadius.circular(16)),
          ),
          const SizedBox(width: 4),
          Container(
            width: 56,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20)),
          ),
          const SizedBox(width: 4),
          Container(
            width: 40,
            height: 32,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16)),
          ),
        ],
      ),
    );
  }
}
