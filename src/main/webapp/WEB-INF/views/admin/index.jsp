<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="es">

<head>

    ```
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Panel administrativo</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/app.css">
    ```

</head>

<body class="min-h-screen bg-slate-100 text-slate-900">

<div class="mx-auto max-w-7xl px-6 py-10">

    ```
    <!-- HEADER -->

    <header class="mb-10 flex flex-col gap-5
               sm:flex-row sm:items-center
               sm:justify-between">

        <div>

            <p class="text-sm font-semibold
                  uppercase tracking-wider
                  text-sky-600">

                Administración

            </p>

            <h1 class="mt-1 text-3xl font-bold">

                Panel administrativo

            </h1>

            <p class="mt-2 text-slate-500">

                Gestiona las semanas de tu portafolio.

            </p>

        </div>


        <!-- ACCIONES -->

        <div class="flex flex-wrap gap-3">


            <!-- PORTAFOLIO -->

            <a href="${pageContext.request.contextPath}/"
               class="inline-flex items-center
                  gap-2 rounded-lg
                  border border-slate-300
                  bg-white px-4 py-2.5
                  text-sm font-semibold
                  text-slate-700
                  transition
                  hover:bg-slate-50">

                Ver portafolio

            </a>


            <!-- LOGOUT -->

            <form action="${pageContext.request.contextPath}/logout"
                  method="post"
                  class="w-full">

                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}">

                <button type="submit"
                        class="flex w-full items-center gap-3 rounded-lg px-4 py-3 text-sm font-semibold text-slate-700 transition-colors hover:bg-slate-100">

                    <span>↪</span>

                    <span>Cerrar sesión</span>

                </button>

            </form>

        </div>

    </header>


    <!-- SEMANAS -->

    <section>

        <div class="mb-6 flex items-center
                justify-between">

            <div>

                <h2 class="text-2xl font-bold">

                    Semanas

                </h2>

                <p class="mt-1 text-sm text-slate-500">

                    Selecciona una semana para
                    administrar sus trabajos.

                </p>

            </div>


            <!-- NUEVA SEMANA -->

            <a href="${pageContext.request.contextPath}/admin/weeks/new"
               class="rounded-lg bg-sky-600
                  px-4 py-2.5
                  text-sm font-semibold
                  text-white
                  transition
                  hover:bg-sky-700">

                + Nueva semana

            </a>

        </div>


        <!-- GRID -->

        <div class="grid gap-6
                sm:grid-cols-2
                lg:grid-cols-3">


            <!-- =====================================
                 CARD DE SEMANA
            ====================================== -->

            <c:forEach var="week" items="${weeks}">

                <article class="group rounded-2xl
                            border border-slate-200
                            bg-white p-6
                            shadow-sm
                            transition
                            hover:-translate-y-1
                            hover:shadow-lg">


                    <!-- NÚMERO -->

                    <div class="flex items-center
                            justify-between">


                        <div class="flex h-14 w-14
                                items-center
                                justify-center
                                rounded-xl
                                bg-sky-100
                                text-xl font-bold
                                text-sky-700">

                        <span>
                            ${week.number}
                        </span>

                        </div>


                        <!-- CANTIDAD DE TRABAJOS -->

                        <span class="rounded-full
                                 bg-slate-100
                                 px-3 py-1
                                 text-xs font-semibold
                                 text-slate-600">

                        <span>
                            ${week.works.size()}
                        </span>

                        trabajos

                    </span>

                    </div>


                    <!-- INFORMACIÓN -->

                    <div class="mt-6">

                        <p class="text-xs font-semibold
                              uppercase tracking-wider
                              text-sky-600">

                            Semana
                            <span>
                            ${week.number}
                        </span>

                        </p>


                        <h3 class="mt-2 text-xl
                               font-bold
                               text-slate-900">

                        <span>
                            ${week.title}
                        </span>

                        </h3>


                        <c:if test="${not empty week.description}">

                            <p class="mt-2 line-clamp-3
                                  text-sm leading-6
                                  text-slate-500">

                                ${week.description}

                            </p>

                        </c:if>

                    </div>


                    <!-- ACCIÓN -->

                    <a href="${pageContext.request.contextPath}/admin/weeks/${week.id}"
                       class="mt-6 flex w-full
                          items-center
                          justify-center
                          gap-2 rounded-lg
                          bg-sky-600
                          px-4 py-3
                          text-sm font-semibold
                          text-white
                          transition
                          hover:bg-sky-700">

                        Ver semana

                        <span>→</span>

                    </a>

                </article>

            </c:forEach>


            <!-- =====================================
                 SIN SEMANAS
            ====================================== -->

            <c:if test="${empty weeks}">

                <div class="col-span-full
                        rounded-2xl
                        border border-dashed
                        border-slate-300
                        bg-white
                        px-6 py-16
                        text-center">

                    <h3 class="text-lg font-bold">

                        No hay semanas registradas

                    </h3>

                    <p class="mt-2 text-sm
                          text-slate-500">

                        Comienza creando tu primera semana.

                    </p>

                    <a href="${pageContext.request.contextPath}/admin/weeks/new"
                       class="mt-6 inline-flex
                          rounded-lg
                          bg-sky-600
                          px-5 py-3
                          text-sm font-semibold
                          text-white
                          hover:bg-sky-700">

                        + Crear primera semana

                    </a>

                </div>

            </c:if>


        </div>

    </section>
    ```

</div>

</body>

</html>
