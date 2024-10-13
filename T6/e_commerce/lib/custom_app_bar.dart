import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Colors.blueGrey,
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/fondoAppBar.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  top: 30,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.95),
                              spreadRadius: 2,
                              blurRadius: 5,
                            )
                          ],
                        ),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('assets/logo.png'),
                          radius: 40,
                        ),
                      ),
                      const SizedBox(width: 40),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.95),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(4, 3),
                            )
                          ],
                        ),
                        width: 250,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Ropa de mujer',
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            suffixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 10),
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      toolbarHeight: 140,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(140);
}
