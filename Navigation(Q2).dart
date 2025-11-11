import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({super.key});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _addressCtrl.dispose();
    super.dispose();
  }

  String? _req(String? v) =>
      (v == null || v.trim().isEmpty) ? 'Required' : null;

  String? _email(String? v) {
    if (_req(v) != null) return 'Required';
    final re = RegExp(r'^[\w\.\-]+@[\w\.\-]+\.\w{2,}$');
    return re.hasMatch(v!.trim()) ? null : 'Enter a valid email';
  }

  String? _phone(String? v) {
    if (_req(v) != null) return 'Required';
    final digits = v!.replaceAll(RegExp(r'\D'), '');
    return (digits.length >= 10 && digits.length <= 13)
        ? null
        : 'Enter a valid phone';
  }

  InputDecoration _fieldDeco(String hint) => InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: Colors.grey.shade500),
    filled: true,
    fillColor: const Color(0xFFF5F6F8),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF00C3FF), width: 1.2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.redAccent),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.redAccent),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A000000),
                  blurRadius: 18,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title (Poppins)
                  Text(
                    'User Information',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Full Name
                  Text(
                    'Full Name',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _nameCtrl,
                    validator: _req,
                    decoration: _fieldDeco('Enter full name'),
                  ),
                  const SizedBox(height: 18),

                  // Email
                  Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    validator: _email,
                    decoration: _fieldDeco('Enter email'),
                  ),
                  const SizedBox(height: 18),

                  // Phone
                  Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _phoneCtrl,
                    keyboardType: TextInputType.phone,
                    validator: _phone,
                    decoration: _fieldDeco('Enter phone'),
                  ),
                  const SizedBox(height: 18),

                  // Address
                  Text(
                    'Address',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _addressCtrl,
                    validator: _req,
                    maxLines: 2,
                    decoration: _fieldDeco('Enter address'),
                  ),
                  const SizedBox(height: 22),

                  // Submit button with gradient
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState?.validate() ?? false) {
                        final data = _UserData(
                          name: _nameCtrl.text.trim(),
                          email: _emailCtrl.text.trim(),
                          phone: _phoneCtrl.text.trim(),
                          address: _addressCtrl.text.trim(),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SubmittedInfoScreen(data: data),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF00E0FF), Color(0xFF00C6FF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3300C6FF),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Data model passed to the second screen
class _UserData {
  final String name, email, phone, address;
  _UserData({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
}

/// Second screen that displays all submitted information
class SubmittedInfoScreen extends StatelessWidget {
  final _UserData data;
  const SubmittedInfoScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F4),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 26, 24, 26),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 18,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Submitted\nInformation',
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      height: 1.15,
                    ),
                  ),
                  const SizedBox(height: 22),
                  _infoTile('Full Name', data.name),
                  _divider(),
                  _infoTile('Email', data.email),
                  _divider(),
                  _infoTile('Phone Number', data.phone),
                  _divider(),
                  _infoTile('Address', data.address),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              height: 1.3,
              color: Color(0xFF222222),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Divider(color: Colors.grey.shade200, thickness: 1),
  );
}
