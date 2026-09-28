import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import '../../../carts/domain/entities/cart.dart';
import '../../data/invoice_pdf_builder.dart';

/// معاينة الفاتورة + الطباعة. زر الطابعة داخل المعاينة يفتح نافذة الطباعة
/// (لاختيار أي طابعة)، وزر "طباعة مباشرة" يرسلها فورًا لطابعة النظام
/// الافتراضية بدون أي نافذة (الأسرع للعمل اليومي).
class InvoicePreviewPage extends StatelessWidget {
  final Cart cart;
  const InvoicePreviewPage({super.key, required this.cart});

  static const _format = PdfPageFormat.roll80;

  Future<void> _printDirect(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      final printers = await Printing.listPrinters();
      final defaults = printers.where((p) => p.isDefault).toList();
      if (defaults.isEmpty) {
        messenger.showSnackBar(const SnackBar(
          content: Text('لا توجد طابعة افتراضية. اضبط طابعة الفواتير كافتراضية بويندوز، أو استخدم زر الطباعة داخل المعاينة.'),
        ));
        return;
      }
      await Printing.directPrintPdf(
        printer: defaults.first,
        onLayout: (format) => InvoicePdfBuilder.build(cart, format),
        format: _format,
      );
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text('تعذّرت الطباعة: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('فاتورة ${cart.customerName}'),
        actions: [
          IconButton(
            tooltip: 'طباعة مباشرة على الطابعة الافتراضية',
            icon: const Icon(Icons.print),
            onPressed: () => _printDirect(context),
          ),
        ],
      ),
      body: PdfPreview(
        build: (format) => InvoicePdfBuilder.build(cart, format),
        initialPageFormat: _format,
        pdfFileName: 'invoice-${cart.id}.pdf',
        canChangePageFormat: false,
        canChangeOrientation: false,
        canDebug: false,
      ),
    );
  }
}
