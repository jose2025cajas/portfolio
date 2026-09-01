<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>José Cárdenas | Software Developer</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/app.css">
</head>

<body>

<%-- Header institucional --%>
<jsp:include page="/WEB-INF/views/fragments/institutional-header.jsp" />

<%-- Navbar --%>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp" />


<main>

    <%-- Hero --%>
    <jsp:include page="/WEB-INF/views/home/sections/hero.jsp" />

    <%-- Proyectos --%>
    <jsp:include page="/WEB-INF/views/home/sections/proyectos.jsp" />
</main>


<%-- Footer --%>
<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />


<script src="${pageContext.request.contextPath}/js/app.js"></script>

</body>
</html>