```jsp
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Semana ${week.number}</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/app.css">

</head>


<body class="min-h-screen bg-slate-100 text-slate-900">

<div class="mx-auto max-w-7xl px-6 py-10">


    <!-- ==========================================
         NAVEGACIÓN
    =========================================== -->

    <div class="mb-8">

        <a href="${pageContext.request.contextPath}/admin"
           class="inline-flex items-center gap-2
                  text-sm font-semibold
                  text-slate-500
                  transition-colors
                  hover:text-sky-600">

            ← Volver al panel

        </a>

    </div>



    <!-- ==========================================
         HEADER DE SEMANA
    =========================================== -->

    <section class="mb-10 rounded-2xl
                    border border-slate-200
                    bg-white
                    p-6
                    shadow-sm">

        <div class="flex flex-col gap-6
                    md:flex-row
                    md:items-start
                    md:justify-between">

            <div class="flex gap-5">

                <!-- NÚMERO -->

                <div class="flex h-20 w-20
                            shrink-0
                            items-center
                            justify-center
                            rounded-2xl
                            bg-sky-600
                            text-3xl
                            font-bold
                            text-white">

                    ${week.number}

                </div>


                <!-- INFORMACIÓN DE LA SEMANA -->

                <div>

                    <p class="text-sm font-semibold
                              uppercase
                              tracking-wider
                              text-sky-600">

                        Semana

                    </p>


                    <h1 class="mt-1 text-3xl font-bold">

                        ${week.title}

                    </h1>


                    <c:if test="${not empty week.description}">

                        <p class="mt-2 max-w-2xl
                                  text-slate-500">

                            ${week.description}

                        </p>

                    </c:if>

                </div>

            </div>


            <!-- EDITAR SEMANA -->

            <a href="${pageContext.request.contextPath}/admin/weeks/edit/${week.id}"
               class="inline-flex
                      items-center
                      justify-center
                      gap-2
                      rounded-lg
                      border border-slate-300
                      bg-white
                      px-4 py-2.5
                      text-sm
                      font-semibold
                      text-slate-700
                      transition-colors
                      hover:bg-slate-50">

                ✏ Editar semana

            </a>

        </div>

    </section>



    <!-- ==========================================
         TRABAJOS
    =========================================== -->

    <section>

        <div class="mb-6 flex
                    flex-col
                    gap-4
                    sm:flex-row
                    sm:items-center
                    sm:justify-between">

            <div>

                <h2 class="text-2xl font-bold">

                    Trabajos

                </h2>

                <p class="mt-1 text-sm text-slate-500">

                    Trabajos asociados a esta semana.

                </p>

            </div>


            <!-- NUEVO TRABAJO -->

            <a href="${pageContext.request.contextPath}/admin/works/new/${week.id}"
               class="inline-flex
                      items-center
                      justify-center
                      rounded-lg
                      bg-sky-600
                      px-4 py-2.5
                      text-sm
                      font-semibold
                      text-white
                      transition-colors
                      hover:bg-sky-700">

                + Nuevo trabajo

            </a>

        </div>



        <!-- ==========================================
             GRID DE TRABAJOS
        =========================================== -->

        <div class="grid gap-6
                    sm:grid-cols-2
                    lg:grid-cols-3">


            <c:forEach var="work"
                       items="${week.works}">


                <article class="overflow-hidden
                                rounded-2xl
                                border border-slate-200
                                bg-white
                                shadow-sm
                                transition
                                hover:-translate-y-1
                                hover:shadow-lg">


                    <!-- IMAGEN -->

                    <div class="h-44 bg-slate-100">

                        <c:choose>

                            <c:when test="${not empty work.imageUrl}">

                                <img
                                        src="${work.imageUrl}"
                                        alt="${work.title}"
                                        class="h-full
                                               w-full
                                               object-cover">

                            </c:when>

                            <c:otherwise>

                                <div class="flex h-full
                                            items-center
                                            justify-center
                                            text-slate-400">

                                    Sin imagen

                                </div>

                            </c:otherwise>

                        </c:choose>

                    </div>



                    <!-- CONTENIDO -->

                    <div class="p-5">


                        <!-- TÍTULO -->

                        <h3 class="text-lg font-bold">

                            ${work.title}

                        </h3>



                        <!-- DESCRIPCIÓN -->

                        <c:if test="${not empty work.description}">

                            <p class="mt-2 line-clamp-3
                                      text-sm
                                      text-slate-500">

                                ${work.description}

                            </p>

                        </c:if>



                        <!-- DOCUMENTOS -->

                        <div class="mt-5 flex
                                    items-center
                                    justify-between
                                    border-t
                                    border-slate-100
                                    pt-4">

                            <span class="text-sm text-slate-500">

                                Documentos

                            </span>


                            <span class="rounded-full
                                         bg-slate-100
                                         px-3 py-1
                                         text-xs
                                         font-bold">

                                <c:choose>

                                    <c:when test="${empty work.documents}">

                                        0

                                    </c:when>

                                    <c:otherwise>

                                        ${work.documents.size()}

                                    </c:otherwise>

                                </c:choose>

                            </span>

                        </div>



                        <!-- DETALLE -->

                        <a href="${pageContext.request.contextPath}/admin/works/${work.id}"
                           class="mt-4 flex w-full
                                  items-center
                                  justify-center
                                  rounded-lg
                                  bg-slate-900
                                  px-4 py-2.5
                                  text-sm
                                  font-semibold
                                  text-white
                                  transition-colors
                                  hover:bg-slate-800">

                            Ver trabajo →

                        </a>

                    </div>

                </article>


            </c:forEach>



            <!-- =====================================
                 SIN TRABAJOS
            ====================================== -->

            <c:if test="${empty week.works}">

                <div class="col-span-full
                            rounded-2xl
                            border
                            border-dashed
                            border-slate-300
                            bg-white
                            px-6
                            py-16
                            text-center">

                    <h3 class="text-lg font-bold">

                        No hay trabajos

                    </h3>


                    <p class="mt-2 text-sm text-slate-500">

                        Esta semana todavía no tiene
                        trabajos registrados.

                    </p>


                    <a href="${pageContext.request.contextPath}/admin/works/new/${week.id}"
                       class="mt-6 inline-flex
                              rounded-lg
                              bg-sky-600
                              px-5 py-3
                              text-sm
                              font-semibold
                              text-white
                              transition-colors
                              hover:bg-sky-700">

                        + Crear trabajo

                    </a>

                </div>

            </c:if>


        </div>

    </section>

</div>

</body>