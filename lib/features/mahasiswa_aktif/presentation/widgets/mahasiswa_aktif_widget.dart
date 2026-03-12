import 'package:flutter/material.dart';
import 'package:week1_mobile/core/constants/app_constants.dart';
import 'package:week1_mobile/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifCard extends StatelessWidget {
  final MahasiswaAktifModel mahasiswa;
  final List<Color>? gradientColors;

  const MahasiswaAktifCard({Key? key, required this.mahasiswa, this.gradientColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = gradientColors ?? [Theme.of(context).primaryColor, Theme.of(context).primaryColor.withOpacity(0.7)];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: colors[0].withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4)),
        ],
        border: Border.all(color: colors[0].withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: colors),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  mahasiswa.nama.substring(0, 1).toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(mahasiswa.nama,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.green.withOpacity(0.3)),
                        ),
                        child: Text(mahasiswa.statusAktif,
                          style: const TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  _row(Icons.badge_outlined, 'NIM: ${mahasiswa.nim}'),
                  const SizedBox(height: 3),
                  _row(Icons.school_outlined, mahasiswa.jurusan),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      _row(Icons.calendar_today_outlined, 'Smt ${mahasiswa.semester}'),
                      const SizedBox(width: 12),
                      _row(Icons.star_outline_rounded, 'IPK: ${mahasiswa.ipk.toStringAsFixed(2)}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
      ],
    );
  }
}