import 'package:flutter/material.dart';

class ImageDisplayScreen extends StatelessWidget {
  const ImageDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors used in the mock
    const bgGrey = Color(0xFFF2F2F2);
    const cardWhite = Colors.white;
    const titleColor = Color(0xFF2B2B2B);
    const labelColor = Color(0xFF424242);
    const pinkA = Color(0xFFFF8BD3);
    const pinkB = Color(0xFFF25E7A);

    return Scaffold(
      backgroundColor: bgGrey,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 18), // screen wrapper
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Big page title (no AppBar to match the mock)
              Text(
                'Image Display',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: titleColor,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 18),

              // White rounded card that contains both sections
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 22, 24, 22),
                decoration: BoxDecoration(
                  color: cardWhite,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Network Image section ---
                    const Text(
                      'Network Image:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: labelColor,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(
                          colors: [pinkA, pinkB],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Image.network(
                        // any globe/icon url works; pick a simple png:
                        'https://img.icons8.com/fluency/240/globe.png',
                        width: 136,
                        height: 136,
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 26),

                    // --- Asset Image section ---
                    const Text(
                      'Asset Image:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: labelColor,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(
                          colors: [pinkA, pinkB],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(
                        // put any image here; see "Asset setup" below
                        'assets/images/sample_asset.png',
                        width: 136,
                        height: 136,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
