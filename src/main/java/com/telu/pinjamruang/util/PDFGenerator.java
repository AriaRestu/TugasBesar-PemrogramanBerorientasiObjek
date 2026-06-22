package com.telu.pinjamruang.util;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.itextpdf.text.pdf.draw.LineSeparator;
import com.telu.pinjamruang.model.peminjaman.Pengajuan;

import java.io.File;
import java.io.FileOutputStream;

public class PDFGenerator {

    private PDFGenerator() {}

    /**
     * Generate PDF F03 (tiket persetujuan) untuk pengajuan yang sudah disetujui.
     *
     * @param pengajuan data pengajuan
     * @param saveDirPath path absolut direktori tempat menyimpan PDF
     * @return nama file PDF yang tersimpan (relatif), atau null jika gagal
     */
    public static String generateF03(Pengajuan pengajuan, String saveDirPath) {
        String fileName = "F03_" + pengajuan.getNoTiket() + ".pdf";
        String filePath = saveDirPath + File.separator + fileName;

        try {
            File dir = new File(saveDirPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            Document doc = new Document(PageSize.A4, 50, 50, 60, 60);
            PdfWriter.getInstance(doc, new FileOutputStream(filePath));
            doc.open();

            Font fontTitle = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
            Font fontHeader = new Font(Font.FontFamily.HELVETICA, 11, Font.BOLD);
            Font fontNormal = new Font(Font.FontFamily.HELVETICA, 11);

            // Header
            Paragraph title = new Paragraph("TIKET PERSETUJUAN PEMINJAMAN RUANG", fontTitle);
            title.setAlignment(Element.ALIGN_CENTER);
            doc.add(title);

            doc.add(new Paragraph("Telkom University", new Font(Font.FontFamily.HELVETICA, 11, Font.ITALIC)));
            doc.add(Chunk.NEWLINE);
            doc.add(new LineSeparator());
            doc.add(Chunk.NEWLINE);

            // Detail tiket
            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(100);
            table.setWidths(new float[]{35, 65});

            addRow(table, "No. Tiket", pengajuan.getNoTiket(), fontHeader, fontNormal);
            addRow(table, "Nama Peminjam", pengajuan.getNamaUser() != null ? pengajuan.getNamaUser() : "-", fontHeader, fontNormal);
            addRow(table, "Ruangan", pengajuan.getNamaRuangan() != null ? pengajuan.getNamaRuangan() : "-", fontHeader, fontNormal);
            addRow(table, "Tanggal Pinjam", pengajuan.getTanggalPinjam() != null ? pengajuan.getTanggalPinjam().toString() : "-", fontHeader, fontNormal);
            addRow(table, "Waktu Mulai", pengajuan.getWaktuMulai() != null ? pengajuan.getWaktuMulai().toString() : "-", fontHeader, fontNormal);
            addRow(table, "Waktu Selesai", pengajuan.getWaktuSelesai() != null ? pengajuan.getWaktuSelesai().toString() : "-", fontHeader, fontNormal);
            addRow(table, "Keperluan", pengajuan.getKeperluan() != null ? pengajuan.getKeperluan() : "-", fontHeader, fontNormal);
            addRow(table, "Status", "DISETUJUI", fontHeader, fontNormal);

            doc.add(table);
            doc.add(Chunk.NEWLINE);

            Paragraph footer = new Paragraph("Dokumen ini diterbitkan secara otomatis oleh sistem Pinjam Ruang Tel-U.", new Font(Font.FontFamily.HELVETICA, 9, Font.ITALIC));
            footer.setAlignment(Element.ALIGN_CENTER);
            doc.add(footer);

            doc.close();
            return fileName;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private static void addRow(PdfPTable table, String label, String value, Font labelFont, Font valueFont) {
        PdfPCell cellLabel = new PdfPCell(new Phrase(label, labelFont));
        cellLabel.setBorder(Rectangle.NO_BORDER);
        cellLabel.setPadding(4);

        PdfPCell cellValue = new PdfPCell(new Phrase(value, valueFont));
        cellValue.setBorder(Rectangle.NO_BORDER);
        cellValue.setPadding(4);

        table.addCell(cellLabel);
        table.addCell(cellValue);
    }
}
