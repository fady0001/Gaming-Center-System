import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../core/constants/invoice_config.dart';
import '../../../core/domain/value_objects/money.dart';
import '../../carts/domain/entities/cart.dart';


class InvoicePdfBuilder {
  InvoicePdfBuilder._();

  static pw.Font? _regular;
  static pw.Font? _bold;

  static Future<void> _loadFonts() async {
    // Tajawal ملفات ثابتة (static) وتدعم العربية؛ خط Cairo المتغيّر
    // (variable) لا يصلح لمكتبة pdf.
    _regular ??= pw.Font.ttf(await rootBundle.load('assets/fonts/Tajawal-Regular.ttf'));
    _bold ??= pw.Font.ttf(await rootBundle.load('assets/fonts/Tajawal-Bold.ttf'));
  }

  static String _money(Money m) =>
      '${m.toDisplayString()} ${InvoiceConfig.currencyLabel}';

  static String _dateTime(DateTime t) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${t.year}/${two(t.month)}/${two(t.day)}  ${two(t.hour)}:${two(t.minute)}';
  }

  static Future<Uint8List> build(Cart cart, PdfPageFormat format) async {
    await _loadFonts();

    final doc = pw.Document(
      theme: pw.ThemeData.withFont(base: _regular!, bold: _bold!),
    );

    var playTotal = const Money.zero();
    for (final l in cart.playLines) {
      playTotal = playTotal + (l.finalCharge ?? const Money.zero());
    }
    final itemsTotal = cart.itemsTotal;
    final grandTotal = cart.finalTotal ?? (playTotal + itemsTotal);

    pw.Widget row(String label, String value, {bool bold = false, double size = 10}) {
      final style = pw.TextStyle(
        fontSize: size,
        fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
      );
      return pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 1.5),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Expanded(child: pw.Text(label, style: style)),
            pw.SizedBox(width: 6),
            pw.Text(value, style: style, textDirection: pw.TextDirection.ltr),
          ],
        ),
      );
    }

    pw.Widget small(String text) => pw.Text(
          text,
          style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey700),
        );

    pw.Widget divider() => pw.Padding(
          padding: const pw.EdgeInsets.symmetric(vertical: 4),
          child: pw.Divider(thickness: 0.6, height: 1),
        );

    doc.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) => pw.Directionality(
          textDirection: pw.TextDirection.rtl,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              pw.Center(
                child: pw.Text(
                  InvoiceConfig.shopName,
                  style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.SizedBox(height: 4),
              pw.Center(child: pw.Text('فاتورة رقم ${cart.id}', style: const pw.TextStyle(fontSize: 10))),
              divider(),
              row('الزبون', cart.customerName),
              row('التاريخ', _dateTime(cart.closedAt ?? cart.createdAt)),
              divider(),
              if (cart.playLines.isNotEmpty) ...[
                pw.Text('اللعب',
                    style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 2),
                for (final l in cart.playLines) ...[
                  row(
                    l.playerCount == null
                        ? l.resourceName
                        : '${l.resourceName} (${l.playerCount} لاعب)',
                    _money(l.finalCharge ?? const Money.zero()),
                  ),
                  small('المدة المحتسبة: ${l.billedMinutes ?? 0} دقيقة'
                      '${l.isOpenTime ? '' : ' — وقت محدد ${l.plannedMinutes} د'}'),
                ],
                divider(),
              ],
              if (cart.items.isNotEmpty) ...[
                pw.Text('المنيو',
                    style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 2),
                for (final i in cart.items) ...[
                  row('${i.name} × ${i.quantity}', _money(i.total)),
                  small('سعر الوحدة: ${_money(i.unitPrice)}'),
                ],
                divider(),
              ],
              if (cart.playLines.isNotEmpty) row('مجموع اللعب', _money(playTotal)),
              if (cart.items.isNotEmpty) row('مجموع المنيو', _money(itemsTotal)),
              pw.SizedBox(height: 4),
              row('الإجمالي', _money(grandTotal), bold: true, size: 13),
              divider(),
              pw.Center(
                child: pw.Text(InvoiceConfig.footerNote,
                    style: const pw.TextStyle(fontSize: 10)),
              ),
            ],
          ),
        ),
      ),
    );

    return doc.save();
  }
}
