<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>
        <c:if test="${empty work.id}">
            Nuevo trabajo
        </c:if>

        <c:if test="${not empty work.id}">
            Editar trabajo
        </c:if>
    </title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/app.css">

</head>


<body class="min-h-screen bg-slate-100 text-slate-900">

<div class="mx-auto max-w-4xl px-6 py-10">


    <!-- HEADER -->

    <div class="mb-8">

        <!-- VOLVER -->

        <c:if test="${empty work.id}">

            <a href="${pageContext.request.contextPath}/admin/weeks/${week.id}"
               class="text-sm font-medium text-sky-600 hover:underline">

                ← Volver

            </a>

        </c:if>


        <c:if test="${not empty work.id}">

            <a href="${pageContext.request.contextPath}/admin/works/${work.id}"
               class="text-sm font-medium text-sky-600 hover:underline">

                ← Volver

            </a>

        </c:if>


        <!-- TÍTULO -->

        <h1 class="mt-4 text-3xl font-bold">

            <c:if test="${empty work.id}">
                Nuevo trabajo
            </c:if>

            <c:if test="${not empty work.id}">
                Editar trabajo
            </c:if>

        </h1>


        <!-- SEMANA -->

        <p class="mt-2 text-slate-500">

            Semana

            <span>
                ${week.number}
            </span>

            —

            <span>
                ${week.title}
            </span>

        </p>

    </div>



    <!-- ================================================= -->
    <!-- CREAR TRABAJO -->
    <!-- ================================================= -->

    <c:if test="${empty work.id}">

        <form
                action="${pageContext.request.contextPath}/admin/works"
                method="post"
                class="space-y-6">


            <!-- SEMANA -->

            <input
                    type="hidden"
                    name="weekId"
                    value="${week.id}">


            <!-- CSRF -->

            <input
                    type="hidden"
                    name="${_csrf.parameterName}"
                    value="${_csrf.token}">



            <!-- INFORMACIÓN -->

            <div class="rounded-2xl
                        bg-white
                        p-6
                        shadow-sm
                        ring-1
                        ring-slate-200">


                <h2 class="text-lg font-semibold">

                    Información del trabajo

                </h2>


                <!-- TÍTULO -->

                <div class="mt-6">

                    <label
                            for="title"
                            class="block text-sm font-medium text-slate-700">

                        Título

                    </label>


                    <input
                            id="title"
                            name="title"
                            type="text"
                            required
                            maxlength="200"
                            value="${work.title}"
                            placeholder="Ej. Desarrollo del portafolio web"

                            class="mt-2 w-full
                                   rounded-lg
                                   border border-slate-300
                                   px-4 py-3
                                   outline-none
                                   transition
                                   focus:border-sky-500
                                   focus:ring-2
                                   focus:ring-sky-100">

                </div>


                <!-- DESCRIPCIÓN -->

                <div class="mt-6">

                    <label
                            for="description"
                            class="block text-sm font-medium text-slate-700">

                        Descripción

                    </label>


                    <textarea
                            id="description"
                            name="description"
                            rows="5"
                            maxlength="1000"
                            placeholder="Describe el trabajo realizado..."

                            class="mt-2 w-full
                                   resize-y
                                   rounded-lg
                                   border border-slate-300
                                   px-4 py-3
                                   outline-none
                                   transition
                                   focus:border-sky-500
                                   focus:ring-2
                                   focus:ring-sky-100">${work.description}</textarea>

                </div>


                <!-- TECNOLOGÍAS -->

                <div class="mt-6">

                    <label
                            for="technologies"
                            class="block text-sm font-medium text-slate-700">

                        Tecnologías utilizadas

                    </label>


                    <input
                            id="technologies"
                            name="technologies"
                            type="text"
                            maxlength="500"
                            value="${work.technologies}"
                            placeholder="Java, Spring Boot, JSP, Tailwind CSS"

                            class="mt-2 w-full
                                   rounded-lg
                                   border border-slate-300
                                   px-4 py-3
                                   outline-none
                                   transition
                                   focus:border-sky-500
                                   focus:ring-2
                                   focus:ring-sky-100">

                </div>

            </div>



            <!-- ================================================= -->
            <!-- ENLACES -->
            <!-- ================================================= -->

            <div class="rounded-2xl
                        bg-white
                        p-6
                        shadow-sm
                        ring-1
                        ring-slate-200">


                <h2 class="text-lg font-semibold">

                    Enlaces

                </h2>


                <p class="mt-1 text-sm text-slate-500">

                    Opcionalmente puedes agregar enlaces
                    al proyecto.

                </p>


                <!-- GITHUB -->

                <div class="mt-6">

                    <label
                            for="githubUrl"
                            class="block text-sm font-medium text-slate-700">

                        GitHub

                    </label>


                    <input
                            id="githubUrl"
                            name="githubUrl"
                            type="url"
                            maxlength="500"
                            value="${work.githubUrl}"
                            placeholder="https://github.com/usuario/proyecto"

                            class="mt-2 w-full
                                   rounded-lg
                                   border border-slate-300
                                   px-4 py-3
                                   outline-none
                                   transition
                                   focus:border-sky-500
                                   focus:ring-2
                                   focus:ring-sky-100">

                </div>


                <!-- DEMO -->

                <div class="mt-6">

                    <label
                            for="demoUrl"
                            class="block text-sm font-medium text-slate-700">

                        Demo

                    </label>


                    <input
                            id="demoUrl"
                            name="demoUrl"
                            type="url"
                            maxlength="500"
                            value="${work.demoUrl}"
                            placeholder="https://mi-proyecto.com"

                            class="mt-2 w-full
                                   rounded-lg
                                   border border-slate-300
                                   px-4 py-3
                                   outline-none
                                   transition
                                   focus:border-sky-500
                                   focus:ring-2
                                   focus:ring-sky-100">

                </div>


                <!-- IMAGEN -->

                <div class="mt-6">

                    <label
                            for="imageUrl"
                            class="block text-sm font-medium text-slate-700">

                        URL de imagen

                    </label>


                    <input
                            id="imageUrl"
                            name="imageUrl"
                            type="url"
                            maxlength="500"
                            value="${work.imageUrl}"
                            placeholder="https://..."

                            class="mt-2 w-full
                                   rounded-lg
                                   border border-slate-300
                                   px-4 py-3
                                   outline-none
                                   transition
                                   focus:border-sky-500
                                   focus:ring-2
                                   focus:ring-sky-100">

                </div>

            </div>



            <!-- BOTONES -->

            <div class="flex flex-col-reverse
                        gap-3
                        sm:flex-row
                        sm:justify-end">


                <a
                        href="${pageContext.request.contextPath}/admin/weeks/${week.id}"

                        class="rounded-lg
                               border border-slate-300
                               bg-white
                               px-5 py-3
                               text-center
                               text-sm font-medium
                               text-slate-700
                               hover:bg-slate-50">

                    Cancelar

                </a>


                <button
                        type="submit"

                        class="rounded-lg
                               bg-sky-600
                               px-5 py-3
                               text-sm font-medium
                               text-white
                               transition
                               hover:bg-sky-700">

                    Crear trabajo

                </button>

            </div>

        </form>

    </c:if>



    <!-- ================================================= -->
    <!-- EDITAR TRABAJO -->
    <!-- ================================================= -->

    <c:if test="${not empty work.id}">

        <form
                action="${pageContext.request.contextPath}/admin/works/update/${work.id}"
                method="post"
                class="space-y-6">


            <!-- SEMANA -->

            <input
                    type="hidden"
                    name="weekId"
                    value="${week.id}">


            <!-- CSRF -->

            <input
                    type="hidden"
                    name="${_csrf.parameterName}"
                    value="${_csrf.token}">



            <!-- INFORMACIÓN -->

            <div class="rounded-2xl
                        bg-white
                        p-6
                        shadow-sm
                        ring-1
                        ring-slate-200">


                <h2 class="text-lg font-semibold">

                    Información del trabajo

                </h2>


                <!-- TÍTULO -->

                <div class="mt-6">

                    <label
                            for="edit-title"
                            class="block text-sm font-medium text-slate-700">

                        Título

                    </label>


                    <input
                            id="edit-title"
                            name="title"
                            type="text"
                            required
                            maxlength="200"
                            value="${work.title}"
                            placeholder="Ej. Desarrollo del portafolio web"

                            class="mt-2 w-full
                                   rounded-lg
                                   border border-slate-300
                                   px-4 py-3
                                   outline-none
                                   transition
                                   focus:border-sky-500
                                   focus:ring-2
                                   focus:ring-sky-100">

                </div>


                <!-- DESCRIPCIÓN -->

                <div class="mt-6">

                    <label
                            for="edit-description"
                            class="block text-sm font-medium text-slate-700">

                        Descripción

                    </label>


                    <textarea
                            id="edit-description"
                            name="description"
                            rows="5"
                            maxlength="1000"
                            placeholder="Describe el trabajo realizado..."

                            class="mt-2 w-full
                                   resize-y
                                   rounded-lg
                                   border border-slate-300
                                   px-4 py-3
                                   outline-none
                                   transition
                                   focus:border-sky-500
                                   focus:ring-2
                                   focus:ring-sky-100">${work.description}</textarea>

                </div>


                <!-- TECNOLOGÍAS -->

                <div class="mt-6">

                    <label
                            for="edit-technologies"
                            class="block text-sm font-medium text-slate-700">

                        Tecnologías utilizadas

                    </label>


                    <input
                            id="edit-technologies"
                            name="technologies"
                            type="text"
                            maxlength="500"
                            value="${work.technologies}"
                            placeholder="Java, Spring Boot, JSP, Tailwind CSS"

                            class="mt-2 w-full
                                   rounded-lg
                                   border border-slate-300
                                   px-4 py-3
                                   outline-none
                                   transition
                                   focus:border-sky-500
                                   focus:ring-2
                                   focus:ring-sky-100">

                </div>

            </div>



            <!-- ================================================= -->
            <!-- ENLACES -->
            <!-- ================================================= -->

            <div class="rounded-2xl
                        bg-white
                        p-6
                        shadow-sm
                        ring-1
                        ring-slate-200">


                <h2 class="text-lg font-semibold">

                    Enlaces

                </h2>


                <p class="mt-1 text-sm text-slate-500">

                    Opcionalmente puedes agregar enlaces
                    al proyecto.

                </p>


                <!-- GITHUB -->

                <div class="mt-6">

                    <label
                            for="edit-githubUrl"
                            class="block text-sm font-medium text-slate-700">

                        GitHub

                    </label>


                    <input
                            id="edit-githubUrl"
                            name="githubUrl"
                            type="url"
                            maxlength="500"
                            value="${work.githubUrl}"
                            placeholder="https://github.com/usuario/proyecto"

                            class="mt-2 w-full
                                   rounded-lg
                                   border border-slate-300
                                   px-4 py-3
                                   outline-none
                                   transition
                                   focus:border-sky-500
                                   focus:ring-2
                                   focus:ring-sky-100">

                </div>


                <!-- DEMO -->

                <div class="mt-6">

                    <label
                            for="edit-demoUrl"
                            class="block text-sm font-medium text-slate-700">

                        Demo

                    </label>


                    <input
                            id="edit-demoUrl"
                            name="demoUrl"
                            type="url"
                            maxlength="500"
                            value="${work.demoUrl}"
                            placeholder="https://mi-proyecto.com"

                            class="mt-2 w-full
                                   rounded-lg
                                   border border-slate-300
                                   px-4 py-3
                                   outline-none
                                   transition
                                   focus:border-sky-500
                                   focus:ring-2
                                   focus:ring-sky-100">

                </div>


                <!-- IMAGEN -->

                <div class="mt-6">

                    <label
                            for="edit-imageUrl"
                            class="block text-sm font-medium text-slate-700">

                        URL de imagen

                    </label>


                    <input
                            id="edit-imageUrl"
                            name="imageUrl"
                            type="url"
                            maxlength="500"
                            value="${work.imageUrl}"
                            placeholder="https://..."

                            class="mt-2 w-full
                                   rounded-lg
                                   border border-slate-300
                                   px-4 py-3
                                   outline-none
                                   transition
                                   focus:border-sky-500
                                   focus:ring-2
                                   focus:ring-sky-100">

                </div>

            </div>



            <!-- BOTONES -->

            <div class="flex flex-col-reverse
                        gap-3
                        sm:flex-row
                        sm:justify-end">


                <a
                        href="${pageContext.request.contextPath}/admin/works/${work.id}"

                        class="rounded-lg
                               border border-slate-300
                               bg-white
                               px-5 py-3
                               text-center
                               text-sm font-medium
                               text-slate-700
                               hover:bg-slate-50">

                    Cancelar

                </a>


                <button
                        type="submit"

                        class="rounded-lg
                               bg-sky-600
                               px-5 py-3
                               text-sm font-medium
                               text-white
                               transition
                               hover:bg-sky-700">

                    Guardar cambios

                </button>

            </div>

        </form>

    </c:if>

</div>

</body>

</html>
