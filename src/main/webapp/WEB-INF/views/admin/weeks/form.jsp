<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <c:choose>
        <c:when test="${week.id == null}">
            <title>Nueva semana</title>
        </c:when>
        <c:otherwise>
            <title>Editar semana</title>
        </c:otherwise>
    </c:choose>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/app.css">

</head>

<body class="min-h-screen bg-slate-100 text-slate-900">

<div class="mx-auto max-w-3xl px-6 py-10">

    <div class="mb-8">

        <c:choose>
            <c:when test="${week.id == null}">
                <a href="${pageContext.request.contextPath}/admin"
                   class="text-sm font-semibold text-slate-500 transition-colors hover:text-sky-600">
                    ← Volver
                </a>
            </c:when>

            <c:otherwise>
                <a href="${pageContext.request.contextPath}/admin/weeks/${week.id}"
                   class="text-sm font-semibold text-slate-500 transition-colors hover:text-sky-600">
                    ← Volver
                </a>
            </c:otherwise>
        </c:choose>

    </div>


    <div class="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm sm:p-8">


        <div class="mb-8">

            <p class="text-sm font-semibold uppercase tracking-wider text-sky-600">
                Administración
            </p>

            <c:choose>

                <c:when test="${week.id == null}">
                    <h1 class="mt-1 text-3xl font-bold">
                        Nueva semana
                    </h1>
                </c:when>

                <c:otherwise>
                    <h1 class="mt-1 text-3xl font-bold">
                        Editar semana
                    </h1>
                </c:otherwise>

            </c:choose>

            <p class="mt-2 text-sm text-slate-500">
                Completa la información de la semana.
            </p>

        </div>


        <c:choose>

            <c:when test="${week.id == null}">

                <form action="${pageContext.request.contextPath}/admin/weeks"
                      method="post"
                      class="space-y-6">

                    <input type="hidden"
                           name="${_csrf.parameterName}"
                           value="${_csrf.token}">


                    <div>

                        <label for="number"
                               class="mb-2 block text-sm font-semibold">
                            Número de semana
                        </label>

                        <input type="number"
                               id="number"
                               name="number"
                               value="${week.number}"
                               min="1"
                               max="52"
                               required
                               placeholder="Ej. 1"
                               class="w-full rounded-lg border border-slate-300 px-4 py-3 outline-none transition focus:border-sky-500 focus:ring-2 focus:ring-sky-100">

                    </div>


                    <div>

                        <label for="title"
                               class="mb-2 block text-sm font-semibold">
                            Título
                        </label>

                        <input type="text"
                               id="title"
                               name="title"
                               value="${week.title}"
                               maxlength="150"
                               required
                               placeholder="Ej. Introducción a Java"
                               class="w-full rounded-lg border border-slate-300 px-4 py-3 outline-none transition focus:border-sky-500 focus:ring-2 focus:ring-sky-100">

                    </div>


                    <div>

                        <label for="description"
                               class="mb-2 block text-sm font-semibold">
                            Descripción
                        </label>

                        <textarea id="description"
                                  name="description"
                                  maxlength="500"
                                  rows="5"
                                  placeholder="Describe brevemente lo realizado durante esta semana..."
                                  class="w-full resize-none rounded-lg border border-slate-300 px-4 py-3 outline-none transition focus:border-sky-500 focus:ring-2 focus:ring-sky-100">${week.description}</textarea>

                    </div>


                    <div class="flex flex-col-reverse gap-3 border-t border-slate-100 pt-6 sm:flex-row sm:justify-end">

                        <a href="${pageContext.request.contextPath}/admin"
                           class="inline-flex items-center justify-center rounded-lg border border-slate-300 bg-white px-5 py-3 text-sm font-semibold text-slate-700 transition-colors hover:bg-slate-50">
                            Cancelar
                        </a>

                        <button type="submit"
                                class="inline-flex items-center justify-center rounded-lg bg-sky-600 px-5 py-3 text-sm font-semibold text-white transition-colors hover:bg-sky-700">
                            Crear semana
                        </button>

                    </div>

                </form>

            </c:when>


            <c:otherwise>

                <form action="${pageContext.request.contextPath}/admin/weeks/update/${week.id}"
                      method="post"
                      class="space-y-6">

                    <input type="hidden"
                           name="${_csrf.parameterName}"
                           value="${_csrf.token}">


                    <div>

                        <label for="number"
                               class="mb-2 block text-sm font-semibold">
                            Número de semana
                        </label>

                        <input type="number"
                               id="number"
                               name="number"
                               value="${week.number}"
                               min="1"
                               max="52"
                               required
                               placeholder="Ej. 1"
                               class="w-full rounded-lg border border-slate-300 px-4 py-3 outline-none transition focus:border-sky-500 focus:ring-2 focus:ring-sky-100">

                    </div>


                    <div>

                        <label for="title"
                               class="mb-2 block text-sm font-semibold">
                            Título
                        </label>

                        <input type="text"
                               id="title"
                               name="title"
                               value="${week.title}"
                               maxlength="150"
                               required
                               placeholder="Ej. Introducción a Java"
                               class="w-full rounded-lg border border-slate-300 px-4 py-3 outline-none transition focus:border-sky-500 focus:ring-2 focus:ring-sky-100">

                    </div>


                    <div>

                        <label for="description"
                               class="mb-2 block text-sm font-semibold">
                            Descripción
                        </label>

                        <textarea id="description"
                                  name="description"
                                  maxlength="500"
                                  rows="5"
                                  placeholder="Describe brevemente lo realizado durante esta semana..."
                                  class="w-full resize-none rounded-lg border border-slate-300 px-4 py-3 outline-none transition focus:border-sky-500 focus:ring-2 focus:ring-sky-100">${week.description}</textarea>

                    </div>


                    <div class="flex flex-col-reverse gap-3 border-t border-slate-100 pt-6 sm:flex-row sm:justify-end">

                        <a href="${pageContext.request.contextPath}/admin/weeks/${week.id}"
                           class="inline-flex items-center justify-center rounded-lg border border-slate-300 bg-white px-5 py-3 text-sm font-semibold text-slate-700 transition-colors hover:bg-slate-50">
                            Cancelar
                        </a>

                        <button type="submit"
                                class="inline-flex items-center justify-center rounded-lg bg-sky-600 px-5 py-3 text-sm font-semibold text-white transition-colors hover:bg-sky-700">
                            Guardar cambios
                        </button>

                    </div>

                </form>

            </c:otherwise>

        </c:choose>


        <c:if test="${week.id != null}">

            <div class="mt-8 border-t border-red-100 pt-6">

                <h2 class="text-sm font-bold text-red-700">
                    Zona peligrosa
                </h2>

                <p class="mt-1 text-sm text-slate-500">
                    Eliminar una semana también eliminará
                    sus trabajos y documentos asociados.
                </p>


                <form action="${pageContext.request.contextPath}/admin/weeks/delete/${week.id}"
                      method="post"
                      class="mt-4">

                    <input type="hidden"
                           name="${_csrf.parameterName}"
                           value="${_csrf.token}">

                    <button type="submit"
                            onclick="return confirm('¿Estás seguro de eliminar esta semana? También se eliminarán sus trabajos y documentos.');"
                            class="rounded-lg border border-red-200 bg-red-50 px-4 py-2.5 text-sm font-semibold text-red-700 transition-colors hover:bg-red-100">
                        Eliminar semana
                    </button>

                </form>

            </div>

        </c:if>

    </div>

</div>

</body>

</html>
