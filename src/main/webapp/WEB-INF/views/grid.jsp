<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Grid Test</title>
	<!-- styles -->
	<link rel="stylesheet" href="/grid/resources/styles/common.css"/>
	<link rel="stylesheet" href="/grid/resources/styles/grid.css"/>
	<link rel="stylesheet" href="/grid/resources/styles/jquery.alerts.css"/>

	<!-- scripts -->
	<script type="text/javascript" src="/grid/resources/scripts/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="/grid/resources/scripts/jquery-ui-1.9.1.custom.min.js"></script>
	<script type="text/javascript" src="/grid/resources/scripts/jquery.alerts.js"></script>
	<script type="text/javascript" src="/grid/resources/scripts/grid.js"></script>
</head>
<body>

<div id="grid">
<div id="overlay" class="hidden">
    <div id="popup" class="tile popup">
        <b></b><span>
        </span><em></em>
    </div>
</div>

<c:set var="cellIndex" value="0" scope="page" />
<c:forEach var="row" begin="1" end="${grid.rows}">

    <c:choose>
        <c:when test='${row % 2 eq 0}'>
            <c:set var="rowColor" value="even" scope="page"/>
        </c:when>
        <c:otherwise>
            <c:set var="rowColor" value="odd" scope="page"/>
        </c:otherwise>
    </c:choose>

    <ul class="${rowColor}">

    <c:forEach var="cell" begin="1" end="${grid.columns}">

        <li id="cell_${grid.tiles[cellIndex].index}" class="${grid.tiles[cellIndex].tileType} ${grid.tiles[cellIndex].tileSafety}"><a><b></b><span><span></span></span><em></em></a>
            <form id="form_${grid.tiles[cellIndex].index}" action="">
                <input name="safety_${grid.tiles[cellIndex].index}" id="safety_${grid.tiles[cellIndex].index}" type="hidden" value="${grid.tiles[cellIndex].tileSafety}"/>
                <input name="type_${grid.tiles[cellIndex].index}" id="type_${grid.tiles[cellIndex].index}" type="hidden" value="${grid.tiles[cellIndex].tileType}"/>
            </form>
            <div id="info_${grid.tiles[cellIndex].index}" class="tile popup hidden ${grid.tiles[cellIndex].tileType}">
                <b></b><span>
                <div class="title">${grid.tiles[cellIndex].tileType.description} - ${grid.tiles[cellIndex].tileSafety.description} <a class="close" href="#">X</a></div>
                <div class="info">
                    <table class="datasheet">
                        <tr>
                            <td>Coordinates</td>
                            <td>${cell}:${row}</td>
                        </tr>
                        <tr>
                            <td>Sector</td>
                            <td>${grid.tiles[cellIndex].index}</td>
                        </tr>
                        <tr>
                            <td>Sector Type</td>
                            <td>${grid.tiles[cellIndex].tileType.description}</td>
                        </tr>

                    </table>

                    <a href="#" title="1" class="adjacent">1</a>
                    <a href="#" title="2" class="adjacent">2</a>
                    <a href="#" title="3" class="adjacent">3</a>

                </div>
                </span><em></em>
            </div>
        </li>

        <c:set var="cellIndex" value="${cellIndex + 1}" scope="page" />

    </c:forEach>

    </ul>

</c:forEach>

</div> <!-- grid -->

</body>
</html>
