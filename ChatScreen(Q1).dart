import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bg = const Color(
      0xFFF0E8DF,
    ); // light warm background (screenshot vibe)
    final headerGreen = const Color(0xFF015E57); // dark teal/green header

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              height: 82,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: headerGreen,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 12,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Back arrow
                  InkWell(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                  // Avatar
                  _GradientAvatar(
                    size: 40,
                    iconSize: 24,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF27C4C2), Color(0xFF0B7C72)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Name + status
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'sanjay Singhania',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 0.2,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'online',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Body list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                children: [
                  _ChatTile(
                    name: 'Aniket Apte',
                    message: 'Hey! How are you doing?',
                    time: '10:30 AM',
                    bubbleColorA: const Color(0xFFB286FF),
                    bubbleColorB: const Color(0xFF6B4CFF),
                    onTap: () => _openChat(context, 'Alice Smith'),
                  ),
                  const SizedBox(height: 16),
                  _ChatTile(
                    name: 'unknown',
                    message: 'See you tomorrow!',
                    time: '9:15 AM',
                    bubbleColorA: const Color(0xFFFF8AD6),
                    bubbleColorB: const Color(0xFFFF6A6A),
                    onTap: () => _openChat(context, 'Bob Johnson'),
                  ),
                  const SizedBox(height: 16),
                  _ChatTile(
                    name: 'Rahul',
                    message: 'Thanks for your help!',
                    time: 'Yesterday',
                    bubbleColorA: const Color(0xFF27D7FF),
                    bubbleColorB: const Color(0xFF00A6FF),
                    onTap: () => _openChat(context, 'Emma Wilson'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openChat(BuildContext context, String name) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => ChatDetailScreen(name: name)));
  }
}

// ===== Widgets =====

class _ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final VoidCallback onTap;
  final Color bubbleStart;
  final Color bubbleEnd;

  _ChatTile({
    required this.name,
    required this.message,
    required this.time,
    required this.onTap,
    required Color bubbleColorA,
    required Color bubbleColorB,
  }) : bubbleStart = bubbleColorA,
       bubbleEnd = bubbleColorB;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _GradientAvatar(
              size: 54,
              iconSize: 30,
              gradient: LinearGradient(
                colors: [bubbleStart, bubbleEnd],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1F1F1F),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      height: 1.3,
                      color: const Color(0xFF555555),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                time,
                style: GoogleFonts.roboto(
                  fontSize: 12.5,
                  color: const Color(0xFF8A8A8A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GradientAvatar extends StatelessWidget {
  final double size;
  final double iconSize;
  final Gradient gradient;

  const _GradientAvatar({
    required this.size,
    required this.iconSize,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Icon(
        Icons.person,
        color: Colors.white.withOpacity(0.95),
        size: iconSize,
      ),
    );
  }
}

// ===== Simple Chat Detail Screen for Navigation =====

class ChatDetailScreen extends StatelessWidget {
  final String name;
  const ChatDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F4F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF015E57),
        elevation: 0,
        title: Text(
          name,
          style: GoogleFonts.roboto(fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: Text('Chat with $name', style: GoogleFonts.roboto(fontSize: 18)),
      ),
    );
  }
}
