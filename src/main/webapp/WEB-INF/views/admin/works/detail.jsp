<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>${work.title} | Trabajo</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/app.css">

</head>


<body class="min-h-screen bg-slate-100 text-slate-900">

<div class="mx-auto max-w-6xl px-6 py-10">


    <!-- ========================================== -->
    <!-- CABECERA -->
    <!-- ========================================== -->

    <div class="mb-8 flex items-center justify-between">

        <div>

            <a href="${pageContext.request.contextPath}/admin/weeks/${work.week.id}"
               class="text-sm text-slate-500 hover:text-slate-900">

                ← Volver a la semana

            </a>


            <h1 class="mt-2 text-3xl font-bold">

                ${work.title}

            </h1>


            <p class="mt-2 text-sm text-slate-500">

                Semana

                <span>

                    ${work.week.number}

                </span>

            </p>

        </div>


        <a href="${pageContext.request.contextPath}/admin/works/edit/${work.id}"

           class="rounded-lg
                  bg-slate-900
                  px-5 py-2.5
                  text-sm
                  font-medium
                  text-white
                  hover:bg-slate-700">

            Editar trabajo

        </a>

    </div>



    <!-- ========================================== -->
    <!-- INFORMACIÓN DEL TRABAJO -->
    <!-- ========================================== -->

    <div class="rounded-xl bg-white p-6 shadow-sm">


        <h2 class="mb-4 text-xl font-semibold">

            Información del trabajo

        </h2>


        <div class="space-y-4">


            <!-- DESCRIPCIÓN -->

            <div>

                <p class="text-sm font-medium text-slate-500">

                    Descripción

                </p>


                <p class="mt-1 text-slate-700">

                    <c:choose>

                        <c:when test="${not empty work.description}">

                            ${work.description}

                        </c:when>

                        <c:otherwise>

                            Sin descripción

                        </c:otherwise>

                    </c:choose>

                </p>

            </div>



            <!-- TECNOLOGÍAS -->

            <div>

                <p class="text-sm font-medium text-slate-500">

                    Tecnologías

                </p>


                <p class="mt-1 text-slate-700">

                    <c:choose>

                        <c:when test="${not empty work.technologies}">

                            ${work.technologies}

                        </c:when>

                        <c:otherwise>

                            No especificadas

                        </c:otherwise>

                    </c:choose>

                </p>

            </div>



            <!-- LINKS -->

            <div class="flex flex-wrap gap-3 pt-2">


                <c:if test="${not empty work.githubUrl}">

                    <a href="${work.githubUrl}"
                       target="_blank"
                       rel="noopener noreferrer"

                       class="rounded-lg
                              border border-slate-300
                              px-4 py-2
                              text-sm
                              hover:bg-slate-50">

                        GitHub

                    </a>

                </c:if>



                <c:if test="${not empty work.demoUrl}">

                    <a href="${work.demoUrl}"
                       target="_blank"
                       rel="noopener noreferrer"

                       class="rounded-lg
                              border border-slate-300
                              px-4 py-2
                              text-sm
                              hover:bg-slate-50">

                        Ver demo

                    </a>

                </c:if>


            </div>


        </div>

    </div>



    <!-- ========================================== -->
    <!-- DOCUMENTOS -->
    <!-- ========================================== -->

    <div class="mt-8 rounded-xl bg-white p-6 shadow-sm">


        <!-- TITULO + BOTON -->

        <div class="flex flex-col gap-4
                    sm:flex-row
                    sm:items-center
                    sm:justify-between">


            <div>

                <h2 class="text-xl font-semibold">

                    Documentos

                </h2>


                <p class="mt-1 text-sm text-slate-500">

                    <c:choose>

                        <c:when test="${not empty documents}">

                            ${documents.size()}

                        </c:when>

                        <c:otherwise>

                            0

                        </c:otherwise>

                    </c:choose>

                    documento(s)

                </p>

            </div>



            <!-- BOTÓN SUBIR -->

            <label for="fileInput"

                   class="inline-flex
                          cursor-pointer
                          items-center
                          justify-center
                          rounded-lg
                          bg-slate-900
                          px-5 py-2.5
                          text-sm
                          font-medium
                          text-white
                          hover:bg-slate-700">

                + Subir archivos

            </label>

        </div>



        <!-- ========================================== -->
        <!-- FORMULARIO DE SUBIDA -->
        <!-- ========================================== -->

        <form action="${pageContext.request.contextPath}/admin/documents/upload"

              method="post"

              enctype="multipart/form-data"

              class="mt-5">


            <!-- ID DEL TRABAJO -->

            <input type="hidden"
                   name="workId"
                   value="${work.id}">


            <!-- INPUT FILE -->

            <input id="fileInput"
                   type="file"
                   name="files"
                   multiple
                   class="hidden"
                   onchange="this.form.submit()">


            <!-- CSRF -->

            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}">


        </form>



        <!-- ========================================== -->
        <!-- LISTA DE DOCUMENTOS -->
        <!-- ========================================== -->

        <div class="mt-6">


            <!-- SIN DOCUMENTOS -->

            <c:if test="${empty documents}">

                <div class="rounded-lg
                            border
                            border-dashed
                            border-slate-300
                            bg-slate-50
                            px-6
                            py-10
                            text-center">


                    <div class="text-4xl">

                        📄

                    </div>


                    <p class="mt-3 font-medium text-slate-700">

                        No hay documentos

                    </p>


                    <p class="mt-1 text-sm text-slate-500">

                        Utiliza "Subir archivos"
                        para agregar documentos a este trabajo.

                    </p>


                </div>

            </c:if>



            <!-- CON DOCUMENTOS -->

            <c:if test="${not empty documents}">

                <div class="divide-y
                            divide-slate-200
                            rounded-lg
                            border
                            border-slate-200">


                    <c:forEach var="document"
                               items="${documents}">


                        <div class="flex flex-col
                                    gap-4
                                    px-5 py-4
                                    sm:flex-row
                                    sm:items-center
                                    sm:justify-between">


                            <!-- INFORMACIÓN -->

                            <div class="flex
                                        min-w-0
                                        items-center
                                        gap-4">


                                <!-- ICONO -->

                                <div class="flex
                                            h-11 w-11
                                            shrink-0
                                            items-center
                                            justify-center
                                            rounded-lg
                                            bg-slate-100
                                            text-xl">

                                    📄

                                </div>



                                <!-- DATOS -->

                                <div class="min-w-0">


                                    <p class="truncate font-medium text-slate-800">

                                        ${document.name}

                                    </p>


                                    <p class="mt-1 text-xs text-slate-500">


                                        <c:choose>

                                            <c:when test="${not empty document.fileName}">

                                                ${document.fileName}

                                            </c:when>

                                            <c:otherwise>

                                                Archivo

                                            </c:otherwise>

                                        </c:choose>


                                        <span class="mx-1">

                                            •

                                        </span>


                                        <c:choose>

                                            <c:when test="${not empty document.fileType}">

                                                ${document.fileType}

                                            </c:when>

                                            <c:otherwise>

                                                Tipo desconocido

                                            </c:otherwise>

                                        </c:choose>


                                    </p>

                                </div>

                            </div>



                            <!-- ACCIONES -->

                            <div class="flex
                                        shrink-0
                                        items-center
                                        gap-2">


                                <!-- PREVISUALIZAR -->

                                <a href="${pageContext.request.contextPath}/admin/documents/preview/${document.id}"

                                   target="_blank"
                                   rel="noopener noreferrer"

                                   class="rounded-lg
                                          border border-slate-300
                                          px-4 py-2
                                          text-sm
                                          font-medium
                                          text-slate-700
                                          hover:bg-slate-50">

                                    Previsualizar

                                </a>



                                <!-- DESCARGAR -->

                                <a href="${pageContext.request.contextPath}/admin/documents/download/${document.id}"

                                   class="rounded-lg
                                          bg-slate-900
                                          px-4 py-2
                                          text-sm
                                          font-medium
                                          text-white
                                          hover:bg-slate-700">

                                    Descargar

                                </a>



                                <!-- ELIMINAR -->

                                <form action="${pageContext.request.contextPath}/admin/documents/delete/${document.id}"

                                      method="post"

                                      onsubmit="return confirm('¿Deseas eliminar este documento?');">


                                    <input type="hidden"
                                           name="${_csrf.parameterName}"
                                           value="${_csrf.token}">


                                    <button type="submit"

                                            class="rounded-lg
                                                   border border-red-200
                                                   px-4 py-2
                                                   text-sm
                                                   font-medium
                                                   text-red-600
                                                   hover:bg-red-50">

                                        Eliminar

                                    </button>


                                </form>


                            </div>


                        </div>


                    </c:forEach>


                </div>

            </c:if>


        </div>


    </div>



    <!-- ========================================== -->
    <!-- ELIMINAR TRABAJO -->
    <!-- ========================================== -->

    <div class="mt-8 flex justify-end">


        <form action="${pageContext.request.contextPath}/admin/works/delete/${work.id}"

              method="post"

              onsubmit="return confirm('¿Deseas eliminar este trabajo?');">


            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}">


            <button type="submit"

                    class="rounded-lg
                           border border-red-300
                           px-5 py-2.5
                           text-sm
                           font-medium
                           text-red-600
                           hover:bg-red-50">

                Eliminar trabajo

            </button>


        </form>


    </div>


</div>

</body>

