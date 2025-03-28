import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:go_router/go_router.dart';
import 'package:marriage_onchain_web/widgets/switch.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  CustomNavbarState createState() => CustomNavbarState();
}

class CustomNavbarState extends State<CustomNavbar> {
  String? walletAddress;
  bool isMenuOpen = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  Future<void> connectWallet() async {
    if (ethereum != null) {
      try {
        final accounts = await ethereum!.requestAccount();
        if (accounts.isNotEmpty) {
          setState(() => walletAddress = accounts.first);
        }
      } catch (e) {
        debugPrint("Wallet connection failed: $e");
      }
    } else {
      debugPrint("No Ethereum provider found. Please install MetaMask.");
    }
  }

  void disconnectWallet() {
    setState(() => walletAddress = null);
  }

  void _toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });

    if (isMenuOpen) {
      _showOverlay();
    } else {
      _removeOverlay();
    }
  }

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder:
          (context) => Positioned(
            top: offset.dy + size.height,
            right: 20.w,
            width: 200.w,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(12.r),
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF2B2B2B)
                      : Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildNavItem(context, 'Home', '/'),
                  _buildNavItem(context, 'Mint', '/mint'),
                  _buildNavItem(context, 'Join Marriage', '/join'),
                ],
              ),
            ),
          ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, String route) {
    return InkWell(
      onTap: () {
        _removeOverlay();
        setState(() => isMenuOpen = false);
        context.go(route);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey.shade800
                      : Colors.grey.shade200,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
      decoration: BoxDecoration(
        color:
            Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF1A1A1A)
                : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 768;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo and Title - ENS Style
              InkWell(
                onTap: () => context.go('/'),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(isMobile ? 6.r : 8.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.transparent,
                      ),
                      child: Image.network(
                        '/assets/images/marriage-onchain.png',
                        height: isMobile ? 36.h : 40.h,
                        width: isMobile ? 36.h : 40.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: isMobile ? 36.h : 40.h,
                            width: isMobile ? 36.h : 40.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFF7860E0).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Center(
                              child: Text(
                                "M",
                                style: TextStyle(
                                  fontSize: isMobile ? 18.sp : 22.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF7860E0),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'Married.base.eth',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 22.sp : 24.sp,
                        color: const Color(0xFF7860E0),
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),

              // Right side - Desktop menu + Connect button
              Row(
                children: [
                  // Show horizontal menu on larger screens
                  if (!isMobile) ...[
                    InkWell(
                      onTap: () => context.go('/'),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        child: Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => context.go('/mint'),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        child: Text(
                          'Mint',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => context.go('/join'),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        child: Text(
                          'Join Marriage',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                  ],

                  // Mobile menu button
                  if (isMobile)
                    CompositedTransformTarget(
                      link: _layerLink,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: _toggleMenu,
                          borderRadius: BorderRadius.circular(30.r),
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.grey.shade800.withOpacity(0.2)
                                      : Colors.grey.shade200.withOpacity(0.5),
                            ),
                            child: Icon(
                              isMenuOpen ? Icons.close : Icons.menu,
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                              size: 24.sp,
                            ),
                          ),
                        ),
                      ),
                    ),

                  if (isMobile) SizedBox(width: 12.w),

                  // Connect Wallet Button - ENS Style
                  walletAddress == null
                      ? Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: const Color(0xFF4C83F3),
                        ),
                        child: ElevatedButton(
                          onPressed: connectWallet,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 14.w : 20.w,
                            ),
                          ),
                          child: Text(
                            'Connect',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                      : Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? const Color(0xFF2B2B2B)
                                  : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 20.w,
                              height: 20.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF4C83F3),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              '${walletAddress!.substring(0, 6)}...${walletAddress!.substring(walletAddress!.length - 4)}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            InkWell(
                              onTap: disconnectWallet,
                              child: Icon(
                                Icons.logout,
                                size: 16.sp,
                                color:
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.grey.shade400
                                        : Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
