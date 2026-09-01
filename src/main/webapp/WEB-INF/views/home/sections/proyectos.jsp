<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<section
        id="proyectos"
        class="relative isolate overflow-hidden
               bg-stone-200
               px-5 py-20
               sm:px-8 sm:py-24
               lg:px-12">

    <!-- ========================================================= -->
    <!-- FONDO -->
    <!-- ========================================================= -->

    <div class="pointer-events-none absolute inset-0 -z-10 overflow-hidden">

        <!-- Glow superior -->
        <div
                class="absolute -left-48 -top-48
                       h-[550px] w-[550px]
                       rounded-full
                       bg-sky-500/10
                       blur-[140px]
                       animate-pulse">
        </div>

        <!-- Glow inferior -->
        <div
                class="absolute -bottom-48 -right-48
                       h-[550px] w-[550px]
                       rounded-full
                       bg-blue-600/10
                       blur-[140px]
                       animate-pulse">
        </div>

        <!-- Glow central -->
        <div
                class="absolute left-1/2 top-1/2
                       h-[350px] w-[350px]
                       -translate-x-1/2
                       -translate-y-1/2
                       rounded-full
                       bg-cyan-500/5
                       blur-[120px]">
        </div>

        <!-- Grid -->
        <div
                class="absolute inset-0 opacity-[0.025]"
                style="
                    background-image:
                    linear-gradient(rgba(148,163,184,.6) 1px, transparent 1px),
                    linear-gradient(90deg, rgba(148,163,184,.6) 1px, transparent 1px);
                    background-size: 40px 40px;
                ">
        </div>

    </div>


    <!-- ========================================================= -->
    <!-- CONTENEDOR -->
    <!-- ========================================================= -->

    <div class="mx-auto max-w-7xl">


        <!-- ========================================================= -->
        <!-- CABECERA -->
        <!-- ========================================================= -->

        <header class="mx-auto mb-14 max-w-3xl text-center">

            <!-- BADGE -->
            <div
                    class="mb-5 inline-flex items-center gap-2
                           rounded-full
                           border border-sky-500/20
                           bg-sky-500/10
                           px-4 py-2
                           text-xs font-semibold
                           uppercase
                           tracking-[0.22em]
                           text-sky-400
                           shadow-lg
                           shadow-sky-950/20">

                <span class="relative flex h-2 w-2">

                    <span
                            class="absolute inline-flex
                                   h-full w-full
                                   animate-ping
                                   rounded-full
                                   bg-sky-400
                                   opacity-75">
                    </span>

                    <span
                            class="relative inline-flex
                                   h-2 w-2
                                   rounded-full
                                   bg-sky-400">
                    </span>

                </span>

                Mi trayectoria

            </div>


            <!-- TÍTULO -->
            <h2
                    class="text-4xl font-black
                           tracking-tight
                           text-white
                           sm:text-5xl
                           lg:text-6xl">

                Proyectos

                <span
                        class="bg-gradient-to-r
                               from-sky-400
                               via-cyan-400
                               to-blue-500
                               bg-clip-text
                               text-transparent">

                    y trabajos

                </span>

            </h2>


            <!-- DESCRIPCIÓN -->
            <p
                    class="mx-auto mt-6
                           max-w-2xl
                           text-base
                           leading-7
                           text-slate-400
                           sm:text-lg">

                Una colección de proyectos, prácticas y trabajos
                desarrollados durante mi formación profesional.

            </p>


            <!-- SEPARADOR -->
            <div
                    class="mx-auto mt-8
                           flex items-center
                           justify-center gap-3">

                <span
                        class="h-px w-16
                               bg-gradient-to-r
                               from-transparent
                               to-sky-500">
                </span>

                <span
                        class="h-1.5 w-1.5
                               rounded-full
                               bg-sky-400
                               shadow-lg
                               shadow-sky-400/50">
                </span>

                <span
                        class="h-px w-16
                               bg-gradient-to-l
                               from-transparent
                               to-sky-500">
                </span>

            </div>

        </header>


        <!-- ========================================================= -->
        <!-- GRID DE SEMANAS -->
        <!-- ========================================================= -->

        <div
                class="grid
                       grid-cols-1
                       gap-6
                       md:grid-cols-2
                       xl:grid-cols-3">


            <!-- ===================================================== -->
            <!-- SEMANAS -->
            <!-- ===================================================== -->

            <c:forEach var="week"
                       items="${weeks}"
                       varStatus="iteration">

                <!-- ================================================= -->
                <!-- CARD SEMANA -->
                <!-- ================================================= -->

                <article
                        class="week-card group relative
                               flex h-[520px]
                               flex-col
                               overflow-hidden
                               rounded-3xl
                               border
                               border-slate-800
                               bg-slate-900/80
                               shadow-2xl
                               shadow-black/20
                               backdrop-blur-xl
                               opacity-0
                               animate-[fadeUp_.7s_ease-out_forwards]
                               transition-all
                               duration-500
                               hover:-translate-y-2
                               hover:border-sky-500/30
                               hover:shadow-[0_25px_70px_-20px_rgba(14,165,233,0.20)]"
                        style="animation-delay: ${iteration.index * 100}ms;">


                    <!-- ================================================= -->
                    <!-- BORDE SUPERIOR -->
                    <!-- ================================================= -->

                    <div
                            class="absolute inset-x-0 top-0
                                   h-[2px]
                                   bg-gradient-to-r
                                   from-transparent
                                   via-sky-400
                                   to-transparent
                                   opacity-40
                                   transition-all
                                   duration-500
                                   group-hover:opacity-100">
                    </div>


                    <!-- ================================================= -->
                    <!-- GLOW -->
                    <!-- ================================================= -->

                    <div
                            class="pointer-events-none
                                   absolute
                                   -right-24
                                   -top-24
                                   h-56 w-56
                                   rounded-full
                                   bg-sky-500/5
                                   blur-3xl
                                   transition-all
                                   duration-700
                                   group-hover:scale-150
                                   group-hover:bg-sky-500/10">
                    </div>


                    <!-- ================================================= -->
                    <!-- HEADER DE SEMANA -->
                    <!-- ================================================= -->

                    <div
                            class="relative shrink-0
                                   border-b
                                   border-slate-800/80
                                   p-3
                                   sm:p-5">

                        <div
                                class="flex items-start
                                       justify-between
                                       gap-4">

                            <!-- INFORMACIÓN -->
                            <div class="min-w-0 flex-1">

                                <!-- SEMANA -->
                                <span
                                        class="text-[11px]
                                               font-bold
                                               uppercase
                                               tracking-[0.25em]
                                               text-sky-400">

                                    Semana ${week.number}

                                </span>


                                <!-- DESCRIPCIÓN -->
                                <p
                                        class="mt-2
                                               truncate
                                               line-clamp-2
                                               text-sm
                                               leading-5
                                               text-slate-500">

                                    ${week.description}

                                </p>

                            </div>


                            <!-- NÚMERO -->
                            <div
                                    class="relative
                                           flex h-12 w-12
                                           shrink-0
                                           items-center
                                           justify-center
                                           overflow-hidden
                                           rounded-2xl
                                           border
                                           border-sky-500/20
                                           bg-sky-500/10
                                           shadow-lg
                                           shadow-sky-950/20
                                           transition-all
                                           duration-500
                                           group-hover:scale-110
                                           group-hover:rotate-3
                                           group-hover:border-sky-400/40">

                                <span
                                        class="absolute inset-0
                                               bg-gradient-to-br
                                               from-sky-400/10
                                               to-transparent">
                                </span>

                                <span
                                        class="relative
                                               text-base
                                               font-black
                                               text-sky-400">

                                    <c:choose>
                                        <c:when test="${week.number < 10}">
                                            0${week.number}
                                        </c:when>

                                        <c:otherwise>
                                            ${week.number}
                                        </c:otherwise>
                                    </c:choose>

                                </span>

                            </div>

                        </div>


                        <!-- CONTADOR -->
                        <div
                                class="mt-5
                                       flex items-center
                                       justify-between">

                            <div
                                    class="flex items-center
                                           gap-2">

                                <span
                                        class="flex h-7 w-7
                                               items-center
                                               justify-center
                                               rounded-lg
                                               bg-sky-500/10
                                               text-sky-400">

                                    <svg
                                            class="h-3.5 w-3.5"
                                            fill="none"
                                            stroke="currentColor"
                                            viewBox="0 0 24 24">

                                        <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="1.8"
                                                d="M4 7a2 2 0 012-2h4l2 2h6a2 2 0 012 2v8a2 2 0 01-2 2H6a2 2 0 01-2-2V7z"/>

                                    </svg>

                                </span>

                                <span
                                        class="text-xs
                                               font-semibold
                                               text-slate-400">

                                    Trabajos

                                </span>

                            </div>


                            <!-- CONTADOR -->
                            <span
                                    class="flex h-7
                                           min-w-7
                                           items-center
                                           justify-center
                                           rounded-full
                                           border
                                           border-slate-700
                                           bg-slate-800
                                           px-2
                                           text-[10px]
                                           font-bold
                                           text-slate-400">

                                ${week.works.size()}

                            </span>

                        </div>

                    </div>


                    <!-- ================================================= -->
                    <!-- ÁREA DE TRABAJOS -->
                    <!-- ================================================= -->

                    <div
                            class="custom-scrollbar
                                   min-h-0
                                   flex-1
                                   overflow-y-auto
                                   p-5
                                   sm:p-6">


                        <!-- ================================================= -->
                        <!-- LISTA -->
                        <!-- ================================================= -->

                        <div class="space-y-3">


                            <!-- ================================================= -->
                            <!-- TRABAJOS -->
                            <!-- ================================================= -->

                            <c:forEach var="work" items="${week.works}">

                                <details
                                        class="work-item group/work
                                               overflow-hidden
                                               rounded-2xl
                                               border
                                               border-slate-800
                                               bg-slate-800/40
                                               transition-all
                                               duration-300
                                               hover:border-sky-500/30
                                               hover:bg-slate-800/70">


                                    <!-- ================================================= -->
                                    <!-- BOTÓN DEL TRABAJO -->
                                    <!-- ================================================= -->

                                    <summary
                                            class="relative
                                                   flex cursor-pointer
                                                   list-none
                                                   items-center
                                                   gap-3
                                                   p-4
                                                   select-none">


                                        <!-- INDICADOR -->
                                        <div
                                                class="absolute
                                                       inset-y-0
                                                       left-0
                                                       w-[2px]
                                                       bg-gradient-to-b
                                                       from-sky-400
                                                       to-blue-600
                                                       opacity-0
                                                       transition-opacity
                                                       duration-300
                                                       group-hover/work:opacity-100">
                                        </div>


                                        <!-- ICONO -->
                                        <div
                                                class="flex h-10 w-10
                                                       shrink-0
                                                       items-center
                                                       justify-center
                                                       rounded-xl
                                                       border
                                                       border-slate-700
                                                       bg-slate-900/80
                                                       text-sky-400
                                                       transition-all
                                                       duration-300
                                                       group-hover/work:scale-105
                                                       group-hover/work:border-sky-500/30">

                                            <svg
                                                    class="h-4 w-4"
                                                    fill="none"
                                                    stroke="currentColor"
                                                    viewBox="0 0 24 24">

                                                <path
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                        stroke-width="1.8"
                                                        d="M3 7h18M5 7l1-3h12l1 3M5 7v13h14V7M9 11h6"/>

                                            </svg>

                                        </div>


                                        <!-- TEXTO -->
                                        <div class="min-w-0 flex-1">

                                            <h4
                                                    class="truncate
                                                           text-sm
                                                           font-semibold
                                                           text-slate-200
                                                           transition-colors
                                                           duration-300
                                                           group-hover/work:text-white">

                                                ${work.title}

                                            </h4>

                                            <p
                                                    class="mt-1
                                                           text-[11px]
                                                           text-slate-600">

                                                Ver documentos

                                            </p>

                                        </div>


                                        <!-- FLECHA -->
                                        <div
                                                class="flex h-7 w-7
                                                       shrink-0
                                                       items-center
                                                       justify-center
                                                       rounded-lg
                                                       text-slate-600
                                                       transition-all
                                                       duration-300
                                                       group-hover/work:text-sky-400">

                                            <svg
                                                    class="work-arrow h-4 w-4
                                                           transition-transform
                                                           duration-300"
                                                    fill="none"
                                                    stroke="currentColor"
                                                    viewBox="0 0 24 24">

                                                <path
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                        stroke-width="2"
                                                        d="M6 9l6 6 6-6"/>

                                            </svg>

                                        </div>

                                    </summary>


                                    <!-- ================================================= -->
                                    <!-- DOCUMENTOS -->
                                    <!-- ================================================= -->

                                    <div
                                            class="documents-panel
                                                   border-t
                                                   border-slate-800
                                                   bg-slate-950/40
                                                   px-3
                                                   pb-3
                                                   sm:px-4
                                                   sm:pb-4">

                                        <div class="pt-3">


                                            <!-- ================================================= -->
                                            <!-- CON DOCUMENTOS -->
                                            <!-- ================================================= -->

                                            <c:if test="${not empty work.documents}">

                                                <div class="space-y-2">


                                                    <!-- ================================================= -->
                                                    <!-- DOCUMENTOS -->
                                                    <!-- ================================================= -->

                                                    <c:forEach var="document"
                                                               items="${work.documents}">

                                                        <div
                                                                class="group/document
                                                                       flex
                                                                       w-full
                                                                       min-w-0
                                                                       items-center
                                                                       gap-2
                                                                       sm:gap-3
                                                                       rounded-xl
                                                                       border
                                                                       border-slate-800
                                                                       bg-slate-900/70
                                                                       p-2.5
                                                                       sm:p-3
                                                                       transition-all
                                                                       duration-300
                                                                       hover:border-sky-500/20
                                                                       hover:bg-slate-800">


                                                            <!-- ICONO DOCUMENTO -->
                                                            <div
                                                                    class="flex h-9 w-9
                                                                           shrink-0
                                                                           items-center
                                                                           justify-center
                                                                           rounded-lg
                                                                           bg-sky-500/10
                                                                           text-sky-400">

                                                                <svg
                                                                        class="h-4 w-4"
                                                                        fill="none"
                                                                        stroke="currentColor"
                                                                        viewBox="0 0 24 24">

                                                                    <path
                                                                            stroke-linecap="round"
                                                                            stroke-linejoin="round"
                                                                            stroke-width="1.8"
                                                                            d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8l-6-6z"/>

                                                                    <path
                                                                            stroke-linecap="round"
                                                                            stroke-linejoin="round"
                                                                            stroke-width="1.8"
                                                                            d="M14 2v6h6"/>

                                                                </svg>

                                                            </div>


                                                            <!-- INFORMACIÓN -->
                                                            <div class="min-w-0 flex-1">

                                                                <p
                                                                        class="truncate
                                                                               text-xs
                                                                               font-medium
                                                                               text-slate-300
                                                                               transition-colors
                                                                               duration-300
                                                                               group-hover/document:text-sky-400">

                                                                    ${document.name}

                                                                </p>


                                                                <div
                                                                        class="mt-1
                                                                               flex
                                                                               min-w-0
                                                                               items-center
                                                                               gap-2">

                                                                    <span
                                                                            class="min-w-0
                                                                                   max-w-[150px]
                                                                                   truncate
                                                                                   text-[10px]
                                                                                   text-slate-600
                                                                                   sm:max-w-[220px]">

                                                                        ${document.fileName}

                                                                    </span>


                                                                    <span
                                                                            class="shrink-0
                                                                                   text-[10px]
                                                                                   text-slate-700">

                                                                        •

                                                                    </span>


                                                                    <span
                                                                            class="shrink-0
                                                                                   text-[10px]
                                                                                   uppercase
                                                                                   text-slate-600">

                                                                        ${document.fileType}

                                                                    </span>

                                                                </div>

                                                            </div>


                                                            <!-- ACCIONES -->
                                                            <div
                                                                    class="flex
                                                                           shrink-0
                                                                           items-center
                                                                           gap-1.5
                                                                           sm:gap-2">


                                                                <!-- PREVISUALIZAR -->
                                                                <a
                                                                        href="${pageContext.request.contextPath}/documents/preview/${document.id}"

                                                                        target="_blank"

                                                                        rel="noopener noreferrer"

                                                                        title="Previsualizar documento"
                                                                        aria-label="Previsualizar documento"

                                                                        class="flex h-9 w-9
                                                                               shrink-0
                                                                               items-center
                                                                               justify-center
                                                                               rounded-lg
                                                                               border
                                                                               border-slate-700
                                                                               bg-slate-800
                                                                               text-slate-400
                                                                               transition-all
                                                                               duration-300
                                                                               hover:border-sky-500/30
                                                                               hover:bg-sky-500/10
                                                                               hover:text-sky-400
                                                                               focus:outline-none
                                                                               focus:ring-2
                                                                               focus:ring-sky-500/30">

                                                                    <svg
                                                                            class="h-4 w-4"
                                                                            fill="none"
                                                                            stroke="currentColor"
                                                                            viewBox="0 0 24 24">

                                                                        <path
                                                                                stroke-linecap="round"
                                                                                stroke-linejoin="round"
                                                                                stroke-width="1.8"
                                                                                d="M2.5 12s3.5-6 9.5-6 9.5 6 9.5 6-3.5 6-9.5 6-9.5-6-9.5-6z"/>

                                                                        <circle
                                                                                cx="12"
                                                                                cy="12"
                                                                                r="2.5"
                                                                                stroke-width="1.8"/>

                                                                    </svg>

                                                                </a>


                                                                <!-- DESCARGAR -->
                                                                <a
                                                                        href="${pageContext.request.contextPath}/documents/download/${document.id}"

                                                                        title="Descargar documento"
                                                                        aria-label="Descargar documento"

                                                                        class="flex h-9 w-9
                                                                               shrink-0
                                                                               items-center
                                                                               justify-center
                                                                               rounded-lg
                                                                               border
                                                                               border-sky-500/20
                                                                               bg-sky-500/10
                                                                               text-sky-400
                                                                               transition-all
                                                                               duration-300
                                                                               hover:border-sky-500/40
                                                                               hover:bg-sky-500/20
                                                                               focus:outline-none
                                                                               focus:ring-2
                                                                               focus:ring-sky-500/30">

                                                                    <svg
                                                                            class="h-4 w-4"
                                                                            fill="none"
                                                                            stroke="currentColor"
                                                                            viewBox="0 0 24 24">

                                                                        <path
                                                                                stroke-linecap="round"
                                                                                stroke-linejoin="round"
                                                                                stroke-width="1.8"
                                                                                d="M12 3v12m0 0l-4-4m4 4l4-4"/>

                                                                        <path
                                                                                stroke-linecap="round"
                                                                                stroke-linejoin="round"
                                                                                stroke-width="1.8"
                                                                                d="M5 21h14"/>

                                                                    </svg>

                                                                </a>

                                                            </div>

                                                        </div>

                                                    </c:forEach>

                                                </div>

                                            </c:if>


                                            <!-- ================================================= -->
                                            <!-- SIN DOCUMENTOS -->
                                            <!-- ================================================= -->

                                            <c:if test="${empty work.documents}">

                                                <div
                                                        class="rounded-xl
                                                               border
                                                               border-dashed
                                                               border-slate-800
                                                               px-4
                                                               py-5
                                                               text-center">

                                                    <svg
                                                            class="mx-auto mb-2
                                                                   h-5 w-5
                                                                   text-slate-700"
                                                            fill="none"
                                                            stroke="currentColor"
                                                            viewBox="0 0 24 24">

                                                        <path
                                                                stroke-linecap="round"
                                                                stroke-linejoin="round"
                                                                stroke-width="1.5"
                                                                d="M20 13V7a2 2 0 00-2-2h-4l-2-2H6a2 2 0 00-2 2v6m16 2v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0H4"/>

                                                    </svg>

                                                    <p
                                                            class="text-[11px]
                                                                   text-slate-600">

                                                        Este trabajo no tiene
                                                        documentos.

                                                    </p>

                                                </div>

                                            </c:if>

                                        </div>

                                    </div>

                                </details>

                            </c:forEach>


                            <!-- ================================================= -->
                            <!-- SIN TRABAJOS -->
                            <!-- ================================================= -->

                            <c:if test="${empty week.works}">

                                <div
                                        class="flex min-h-[180px]
                                               flex-col
                                               items-center
                                               justify-center
                                               rounded-2xl
                                               border
                                               border-dashed
                                               border-slate-800
                                               bg-slate-900/30
                                               p-6
                                               text-center">

                                    <div
                                            class="mb-3
                                                   flex h-11 w-11
                                                   items-center
                                                   justify-center
                                                   rounded-xl
                                                   bg-slate-800
                                                   text-slate-600">

                                        <svg
                                                class="h-5 w-5"
                                                fill="none"
                                                stroke="currentColor"
                                                viewBox="0 0 24 24">

                                            <path
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                    stroke-width="1.5"
                                                    d="M20 13V7a2 2 0 00-2-2h-4l-2-2H6a2 2 0 00-2 2v6m16 2v5a2 2 0 01-2-2v-5m16 0H4"/>

                                        </svg>

                                    </div>

                                    <p
                                            class="text-xs
                                                   leading-5
                                                   text-slate-600">

                                        Esta semana todavía no tiene
                                        trabajos registrados.

                                    </p>

                                </div>

                            </c:if>

                        </div>

                    </div>


                    <!-- ================================================= -->
                    <!-- FOOTER -->
                    <!-- ================================================= -->

                    <footer
                            class="relative shrink-0
                                   border-t
                                   border-slate-800/80
                                   px-6
                                   py-2">

                        <div
                                class="flex items-center
                                       justify-between">

                            <span
                                    class="text-[10px]
                                           uppercase
                                           tracking-wider
                                           text-slate-600">

                                Formación profesional

                            </span>

                        </div>

                    </footer>

                </article>

            </c:forEach>


            <!-- ===================================================== -->
            <!-- SIN SEMANAS -->
            <!-- ===================================================== -->

            <c:if test="${empty weeks}">

                <div
                        class="xl:col-span-3
                               md:col-span-2
                               flex min-h-[420px]
                               items-center
                               justify-center
                               rounded-3xl
                               border
                               border-dashed
                               border-slate-800
                               bg-slate-900/40">

                    <div class="text-center">

                        <div
                                class="mx-auto mb-5
                                       flex h-16 w-16
                                       items-center
                                       justify-center
                                       rounded-2xl
                                       bg-slate-800
                                       text-slate-600">

                            <svg
                                    class="h-7 w-7"
                                    fill="none"
                                    stroke="currentColor"
                                    viewBox="0 0 24 24">

                                <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="1.5"
                                        d="M20 13V7a2 2 0 00-2-2h-4l-2-2H6a2 2 0 00-2 2v6m16 2v5a2 2 0 01-2-2v-5m16 0H4"/>

                            </svg>

                        </div>

                        <h3
                                class="text-lg
                                       font-semibold
                                       text-slate-300">

                            No hay proyectos todavía

                        </h3>

                        <p
                                class="mt-2
                                       max-w-sm
                                       text-sm
                                       leading-6
                                       text-slate-600">

                            Las semanas y trabajos aparecerán
                            aquí cuando sean registrados.

                        </p>

                    </div>

                </div>

            </c:if>

        </div>

    </div>


    <!-- ========================================================= -->
    <!-- ESTILOS -->
    <!-- ========================================================= -->

    <style>

        @keyframes fadeUp {

            from {
                opacity: 0;
                transform:
                        translateY(30px)
                        scale(.98);
            }

            to {
                opacity: 1;
                transform:
                        translateY(0)
                        scale(1);
            }

        }


        .documents-panel {

            display: grid;

            grid-template-rows: 0fr;

            opacity: 0;

            transition:
                    grid-template-rows .35s ease,
                    opacity .25s ease;

        }


        details[open] .documents-panel {

            grid-template-rows: 1fr;

            opacity: 1;

        }


        .documents-panel > div {

            overflow: hidden;

        }


        .work-arrow {

            transform: rotate(0deg);

        }


        details[open] .work-arrow {

            transform: rotate(180deg);

        }


        details[open] {

            border-color:
                    rgba(14, 165, 233, .25);

            background:
                    rgba(30, 41, 59, .65);

        }


        details[open] summary {

            background:
                    rgba(14, 165, 233, .035);

        }


        .custom-scrollbar {

            scrollbar-width: thin;

            scrollbar-color:
                    rgba(71, 85, 105, .6)
                    transparent;

        }


        .custom-scrollbar::-webkit-scrollbar {

            width: 5px;

        }


        .custom-scrollbar::-webkit-scrollbar-track {

            background: transparent;

        }


        .custom-scrollbar::-webkit-scrollbar-thumb {

            background:
                    rgba(71, 85, 105, .6);

            border-radius: 999px;

        }


        .custom-scrollbar::-webkit-scrollbar-thumb:hover {

            background:
                    rgba(14, 165, 233, .6);

        }


        summary::-webkit-details-marker {

            display: none;

        }


        summary {

            list-style: none;

        }


        summary::marker {

            display: none;

        }


        @media (prefers-reduced-motion: reduce) {

            *,
            *::before,
            *::after {

                animation-duration: .01ms !important;

                animation-iteration-count: 1 !important;

                transition-duration: .01ms !important;

                scroll-behavior: auto !important;

            }

        }

    </style>

</section>