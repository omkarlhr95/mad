import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// The main screen with the pink-magenta background and profile card.
class TinderProfileScreen extends StatelessWidget {
  const TinderProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Top pink-magenta band like your screenshot
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF87C3), Color(0xFFFF4EB0)],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: const SafeArea(
          child: Center(
            child: TinderProfileCard(
              name: 'Sarah',
              age: 25,
              bio:
                  'Love traveling and\nphotography. Coffee\nenthusiast. Always up for\nnew adventures!',
            ),
          ),
        ),
      ),
    );
  }
}

/// The white rounded profile card with avatar, name, age, bio, and buttons.
class TinderProfileCard extends StatelessWidget {
  final String name;
  final int age;
  final String bio;

  const TinderProfileCard({
    super.key,
    required this.name,
    required this.age,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.sizeOf(
      context,
    ).width.clamp(320.0, 380.0);

    return Container(
      width: cardWidth,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.fromLTRB(22, 26, 22, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 22,
            offset: Offset(0, 10),
          ),
          BoxShadow(
            color: Color(0x10FF96BE),
            blurRadius: 30,
            spreadRadius: 6,
            offset: Offset(10, 18),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Circular gradient avatar (mock-style)
          Container(
            width: 145,
            height: 145,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF7B52FF), Color(0xFF2E41A5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 18,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              Icons.person,
              size: 86,
              color: const Color(0xFF3A268E).withOpacity(0.9),
            ),
          ),

          const SizedBox(height: 22),

          // Name (Inter bold)
          Text(
            name,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              height: 1.0,
              color: const Color(0xFF2B2B2B),
              letterSpacing: 0.2,
            ),
          ),

          const SizedBox(height: 10),

          // Age
          Text(
            '$age',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
              height: 1.0,
            ),
          ),

          const SizedBox(height: 22),

          // Bio
          Text(
            bio,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Colors.grey.shade700,
            ),
          ),

          const SizedBox(height: 32),

          // Action buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _RoundActionButton(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF8A8A), Color(0xFFFF5757)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shadow: BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 18,
                  offset: Offset(0, 8),
                ),
                icon: Icons.close_rounded,
                iconColor: Color(0xFFFF3E57),
              ),
              SizedBox(width: 28),
              _RoundActionButton(
                gradient: LinearGradient(
                  colors: [Color(0xFF49E08B), Color(0xFF2EB96F)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shadow: BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 18,
                  offset: Offset(0, 8),
                ),
                icon: Icons.favorite_rounded,
                iconColor: Color(0xFFFF4C8E),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RoundActionButton extends StatelessWidget {
  final LinearGradient gradient;
  final BoxShadow shadow;
  final IconData icon;
  final Color iconColor;

  const _RoundActionButton({
    required this.gradient,
    required this.shadow,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 62,
      height: 62,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
        boxShadow: [shadow],
      ),
      child: Center(
        child: Icon(icon, size: 30, color: iconColor.withOpacity(0.95)),
      ),
    );
  }
}
