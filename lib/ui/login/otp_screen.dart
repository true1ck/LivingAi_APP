import 'package:flutter/material.dart';
import 'package:livingai_app/ui/profile/create_profile_screen.dart';

// Reusing colors from existing screens
const LightCream = Color(0xFFFFFBEB);
const LighterCream = Color(0xFFFEFCE8);
const LightestGreen = Color(0xFFF7FEE7);
const AccentOrange = Color(0xFFFE9A00);
const DarkText = Color(0xFF364153);
const MutedText = Color(0xFF4A5565);

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // Controllers and FocusNodes for the 4 OTP fields
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    // Add listeners to move focus automatically
    for (int i = 0; i < 3; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.length == 1) {
          _focusNodes[i+1].requestFocus();
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  // Function to build a single OTP input box
  Widget _buildOtpBox(int index) {
    return Container(
      width: 60,
      height: 60,
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
      alignment: Alignment.center,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: "", // Hide the counter
        ),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }


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
                  "OTP",
                  style: TextStyle(
                    fontSize: 16,
                    color: DarkText,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Spacer(flex: 2),

                const Center(
                  child: Text(
                    "Enter OTP",
                    style: TextStyle(fontSize: 22, color: MutedText, fontWeight: FontWeight.w500),
                  ),
                ),

                const SizedBox(height: 32),

                // OTP input boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) => _buildOtpBox(index)),
                ),

                const SizedBox(height: 48),

                // Continue button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      final otp = _controllers.map((c) => c.text).join();
                      if (otp.length == 4) {
                         // OTP is complete, proceed to create profile
                         Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(builder: (context) => const CreateProfileScreen()),
                         );
                      } else {
                         ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(content: Text("Please enter all 4 digits")),
                         );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AccentOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
