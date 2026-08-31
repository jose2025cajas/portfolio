package com.jose.portfolio.presentation.controller;

import com.jose.portfolio.domain.document.Document;
import com.jose.portfolio.domain.work.Work;
import com.jose.portfolio.service.DocumentService;
import com.jose.portfolio.service.WorkService;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Controller
@RequestMapping("/admin/documents")
public class DocumentAdminController {

    private final DocumentService documentService;
    private final WorkService workService;

    /*
     * Carpeta donde se almacenarán físicamente los archivos.
     *
     * Quedará en:
     * uploads/documents
     */
    private final Path uploadDirectory =
            Paths.get("uploads/documents");

    public DocumentAdminController(
            DocumentService documentService,
            WorkService workService
    ) {
        this.documentService = documentService;
        this.workService = workService;

        createUploadDirectory();
    }

    // ==========================================================
    // CREAR CARPETA DE ARCHIVOS
    // ==========================================================

    private void createUploadDirectory() {

        try {

            Files.createDirectories(uploadDirectory);

        } catch (IOException e) {

            throw new RuntimeException(
                    "No se pudo crear la carpeta de documentos",
                    e
            );
        }
    }

    // ==========================================================
    // SUBIR ARCHIVOS
    // ==========================================================

    @PostMapping("/upload")
    public String upload(
            @RequestParam Long workId,
            @RequestParam("files") MultipartFile[] files
    ) {

        Work work = workService.findById(workId);

        for (MultipartFile file : files) {

            if (file.isEmpty()) {
                continue;
            }

            try {

                /*
                 * Nombre original.
                 */
                String originalFileName =
                        file.getOriginalFilename();

                if (originalFileName == null ||
                        originalFileName.isBlank()) {

                    continue;
                }

                /*
                 * Generamos un nombre único para evitar
                 * conflictos entre archivos.
                 */
                String storedFileName =
                        UUID.randomUUID()
                                + "_"
                                + originalFileName;

                /*
                 * Ruta física.
                 */
                Path filePath =
                        uploadDirectory.resolve(storedFileName);

                /*
                 * Guardamos físicamente el archivo.
                 */
                Files.copy(
                        file.getInputStream(),
                        filePath
                );

                /*
                 * Creamos el registro en la base de datos.
                 */
                Document document = new Document();

                document.setName(originalFileName);
                document.setFileName(storedFileName);
                document.setFilePath(
                        filePath.toString()
                );
                document.setFileType(
                        file.getContentType() != null
                                ? file.getContentType()
                                : "application/octet-stream"
                );
                document.setFileSize(
                        file.getSize()
                );

                /*
                 * Relación con el trabajo.
                 */
                document.setWork(work);

                /*
                 * Guardamos en MySQL.
                 */
                documentService.save(document);

            } catch (IOException e) {

                throw new RuntimeException(
                        "Error al guardar el archivo",
                        e
                );
            }
        }

        /*
         * Regresamos al detalle del trabajo.
         */
        return "redirect:/admin/works/" + workId;
    }

    // ==========================================================
    // DESCARGAR DOCUMENTO
    // ==========================================================

    @GetMapping("/download/{id}")
    public ResponseEntity<Resource> download(
            @PathVariable Long id
    ) {

        Document document =
                documentService.findById(id);

        Path filePath =
                Paths.get(document.getFilePath());

        Resource resource =
                new FileSystemResource(filePath);

        /*
         * Verificamos que el archivo exista.
         */
        if (!resource.exists()) {

            return ResponseEntity.notFound().build();
        }

        /*
         * Intentamos utilizar el tipo MIME almacenado.
         */
        MediaType mediaType;

        try {

            String contentType =
                    Files.probeContentType(filePath);

            if (contentType != null) {

                mediaType =
                        MediaType.parseMediaType(contentType);

            } else {

                mediaType =
                        MediaType.APPLICATION_OCTET_STREAM;
            }

        } catch (IOException e) {

            mediaType =
                    MediaType.APPLICATION_OCTET_STREAM;
        }

        return ResponseEntity.ok()
                .contentType(mediaType)
                .header(
                        HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename=\"" +
                                document.getName() +
                                "\""
                )
                .body(resource);
    }

    // ==========================================================
// PREVISUALIZAR DOCUMENTO
// ==========================================================

    @GetMapping("/preview/{id}")
    public ResponseEntity<Resource> preview(
            @PathVariable Long id
    ) {

        Document document = documentService.findById(id);

        Path filePath = Paths.get(document.getFilePath());

        Resource resource = new FileSystemResource(filePath);

        if (!resource.exists()) {
            return ResponseEntity.notFound().build();
        }

        MediaType mediaType;

        try {

            String contentType = Files.probeContentType(filePath);

            if (contentType != null) {

                mediaType = MediaType.parseMediaType(contentType);

            } else {

                mediaType = MediaType.APPLICATION_OCTET_STREAM;
            }

        } catch (IOException e) {

            mediaType = MediaType.APPLICATION_OCTET_STREAM;
        }

        return ResponseEntity.ok()
                .contentType(mediaType)
                .header(
                        HttpHeaders.CONTENT_DISPOSITION,
                        "inline; filename=\"" +
                                document.getName() +
                                "\""
                )
                .body(resource);
    }

    // ==========================================================
    // ELIMINAR DOCUMENTO
    // ==========================================================

    @PostMapping("/delete/{id}")
    public String delete(
            @PathVariable Long id
    ) {

        Document document =
                documentService.findById(id);

        Long workId =
                document.getWork().getId();

        /*
         * Eliminamos el archivo físico.
         */
        try {

            Path filePath =
                    Paths.get(document.getFilePath());

            Files.deleteIfExists(filePath);

        } catch (IOException e) {

            throw new RuntimeException(
                    "No se pudo eliminar el archivo físico",
                    e
            );
        }

        /*
         * Eliminamos el registro de MySQL.
         */
        documentService.deleteById(id);

        /*
         * Volvemos al trabajo.
         */
        return "redirect:/admin/works/" + workId;
    }
}