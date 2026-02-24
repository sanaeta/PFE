import 'package:flutter/material.dart';
import 'package:mobile_app_flutter_examino/configuration/theme/app_theme.dart';
import 'package:mobile_app_flutter_examino/configuration/connexion_api/api_service.dart';

class RegisterScreen extends StatefulWidget { const RegisterScreen({super.key}); @override State<RegisterScreen> createState() => _RegisterScreenState(); }

class _RegisterScreenState extends State<RegisterScreen> {
  final _nomController = TextEditingController(); final _prenomController = TextEditingController();
  final _emailController = TextEditingController(); final _passwordController = TextEditingController();
  List<dynamic> _listeFilieres = []; String? _selectedFiliereId; bool _isLoading = false;

  @override void initState() { super.initState(); _chargerFilieres(); }
  void _chargerFilieres() async { var f = await ApiService().getFilieres(); setState(() => _listeFilieres = f); }

  void _register() async {
    if (_selectedFiliereId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Veuillez choisir une filière"), backgroundColor: Colors.orange));
      return;
    }
    setState(() => _isLoading = true);
    bool s = await ApiService().register(_nomController.text, _prenomController.text, _emailController.text, _passwordController.text, int.parse(_selectedFiliereId!));
    setState(() => _isLoading = false);
    if (s && mounted) { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Inscription réussie!"), backgroundColor: Colors.green)); Navigator.pop(context); }
    else if (mounted) { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erreur lors de l'inscription"), backgroundColor: Colors.red)); }
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(children: [
        Align(alignment: Alignment.topRight, child: IconButton(icon: const Icon(Icons.cancel, color: AppTheme.primaryColor), onPressed: () => Navigator.pop(context))),
        const Text("S'inscrire", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)), const SizedBox(height: 10),
        Image.asset('assets/images/register_img.png', height: 120, errorBuilder: (c,e,s) => const Icon(Icons.image, size: 80)), const SizedBox(height: 20),
        TextField(controller: _nomController, decoration: AppTheme.inputDecoration("nom", Icons.person_outline)), const SizedBox(height: 15),
        TextField(controller: _prenomController, decoration: AppTheme.inputDecoration("prenom", Icons.person_outline)), const SizedBox(height: 15),
        TextField(controller: _emailController, decoration: AppTheme.inputDecoration("Email", Icons.email_outlined)), const SizedBox(height: 15),
        TextField(controller: _passwordController, obscureText: true, decoration: AppTheme.inputDecoration("mot de passe", Icons.lock_outline)), const SizedBox(height: 15),
        DropdownButtonFormField<String>(decoration: AppTheme.inputDecoration("Choisir votre filière", Icons.school_outlined), value: _selectedFiliereId, items: _listeFilieres.map((f) => DropdownMenuItem<String>(value: f['id'].toString(), child: Text(f['nom']))).toList(), onChanged: (v) => setState(() => _selectedFiliereId = v)),
        const SizedBox(height: 20), SizedBox(width: 150, height: 45, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor), onPressed: _isLoading ? null : _register, child: _isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text("S'inscrire", style: TextStyle(color: Colors.white)))),
        const SizedBox(height: 20), Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Text("Vous avez déjà un compte ? ", style: TextStyle(fontSize: 12)), GestureDetector(onTap: () => Navigator.pop(context), child: const Text("Se connecter", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, decoration: TextDecoration.underline)))])
      ]))),
    );
  }
}