import 'package:flutter/material.dart';

void main() {
  runApp(const VitalDentistApp());
}

class VitalDentistApp extends StatelessWidget {
  const VitalDentistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vital Dentist | Inicio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // FONDO
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFF8FBFC),
                  Color(0xFFE7ECEF), 
                  Color(0xFFD7E3EA),
                ],
              ),
            ),
          ),
          
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF786F9D).withOpacity(0.15),
              ),
            ),
          ),

        
          SafeArea(
            child: Column(
              children: [
                const HeaderWidget(),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 992) {
                        return const Center(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(horizontal: 80.0),
                            child: DesktopLayout(),
                          ),
                        );
                      } else {
                        return const SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
                          child: MobileLayout(),
                        );
                      }
                    },
                  ),
                ),
                const FooterWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//HEADER 
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      decoration: const BoxDecoration(
        color: Color(0xE6274C77), 
        border: Border(
          bottom: BorderSide(
            color: Color(0x8CD7A28A), 
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/imagenes/logo2.0.png',
            height: 48,
            width: 48,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.shield, color: Color(0xFF8AD7A2), size: 36),
          ),
          const SizedBox(width: 16),
          const Text(
            'Vital Dentist',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

//DISEÑO ESCRITORIO
class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const TextKicker(),
                  const SizedBox(height: 12),
                  const TextTitle(),
                  const SizedBox(height: 18),
                  const TextCopy(),
                  const SizedBox(height: 40),
                  const ButtonGradient(),
                ],
              ),
            ),
          ),
          const SizedBox(width: 60),
          
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: const FloatingImplantWrapper(),
            ),
          ),
        ],
      ),
    );
  }
}

//DISEÑO MÓVIL
class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const FloatingImplantWrapper(),
        const SizedBox(height: 40),
        const TextKicker(),
        const SizedBox(height: 12),
        const TextTitle(),
        const SizedBox(height: 18),
        const TextCopy(),
        const SizedBox(height: 32),
        const ButtonGradient(),
      ],
    );
  }
}

//WIDGETS DE TEXTO 
class TextKicker extends StatelessWidget {
  const TextKicker({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'AGENDA ODONTOLÓGICA',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w900,
        color: Color(0xFF6096BA), 
        letterSpacing: 1.2,
      ),
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Vital Dentist',
      style: TextStyle(
        fontSize: 64,
        fontWeight: FontWeight.w900,
        color: Color(0xFF274C77), 
        height: 0.95,
      ),
    );
  }
}

class TextCopy extends StatelessWidget {
  const TextCopy({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Gestiona citas odontológicas de forma rápida, segura y sencilla. Nuestra plataforma permite a especialistas administrar agendas, consultar horarios disponibles y mantener un mejor control de cada atención.',
      style: TextStyle(
        fontSize: 17,
        color: Color(0xCC17324A), 
        height: 1.6,
      ),
    );
  }
}

//BOTÓN INICIAR SESIÓN
class ButtonGradient extends StatefulWidget {
  const ButtonGradient({super.key});

  @override
  State<ButtonGradient> createState() => _ButtonGradientState();
}

class _ButtonGradientState extends State<ButtonGradient> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: _isHovered ? const EdgeInsets.all(2.0) : EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF274C77), 
              Color(0xFF6096BA), 
              Color(0xFF8AD7A2), 
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF274C77).withOpacity(_isHovered ? 0.35 : 0.24),
              blurRadius: _isHovered ? 42 : 35,
              offset: Offset(0, _isHovered ? 20 : 18),
            )
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: const Text(
            'Iniciar Sesión',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
//IMPLANTE DEL LANDING 
class FloatingImplantWrapper extends StatefulWidget {
  const FloatingImplantWrapper({super.key});

  @override
  State<FloatingImplantWrapper> createState() => _FloatingImplantWrapperState();
}

class _FloatingImplantWrapperState extends State<FloatingImplantWrapper> with SingleTickerProviderStateMixin {
  late final AnimationController _floatController;
  late final Animation<double> _yAnimation;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2700),
    )..repeat(reverse: true);

    _yAnimation = Tween<double>(begin: 0, end: -18).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _yAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _yAnimation.value),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 550),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 20,
                    child: Container(
                      width: 320,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF274C77).withOpacity(0.24),
                            blurRadius: 40,
                            spreadRadius: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/imagenes/implante_3d1.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image, size: 150, color: Colors.grey);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

//FOOTER LANDING
class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18.0),
      color: const Color(0xFF274C77), 
      child: const Text(
        '© 2026 Vital Dentist. Panel de Agenda Odontológica.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

//INICIO SESIÓN
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFEEF2F7), Color(0xFFD7E3EA)],
              ),
            ),
          ),

          Positioned(
            top: 40,
            left: 40,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF274C77)),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Container(
                width: 400, 
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 45),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF274C77).withOpacity(0.08),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    )
                  ]
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'VitalDentist',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF274C77), 
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Bienvenido de nuevo',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF786F9D), 
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 40),
                    
                    const CustomTextField(
                      label: 'Numero de Documento',
                      hintText: 'ej: 102367967',
                    ),
                    const SizedBox(height: 20),
                    
                    const CustomTextField(
                      label: 'Contraseña',
                      hintText: '********',
                      isPassword: true,
                    ),
                    
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(top: 12, bottom: 24),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Olvidaste tu contraseña?',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF786F9D),
                          ),
                        ),
                      ),
                    ),
                    
                    const LoginSubmitButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Color(0xFF17324A),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black26, fontSize: 13),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF6096BA), width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF274C77), 
            Color(0xFF6096BA), 
            Color(0xFF8AD7A2), 
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6096BA).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: const Text(
          'Ingresar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class BackgroundPattern extends StatelessWidget {
  const BackgroundPattern({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.03, 
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 60, 
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return const Icon(Icons.shield_outlined, size: 28, color: Color(0xFF274C77));
        },
      ),
    );
  }
}