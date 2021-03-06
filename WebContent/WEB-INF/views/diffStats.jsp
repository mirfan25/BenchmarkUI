<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <html>

            <head>
                <title>AppBenchmark</title>
                <jsp:include page="header.jsp" />
                <spring:url value="/resources/css/main.css" var="mainCSS" />
                <spring:url value="/resources/js/diffStats.js" var="diffStatsJS" />
                <spring:url value="/resources/css/magnific-popup.css" var="magneficPopupCSS" />
                <spring:url value="/resources/js/jquery.magnific-popup.js" var="magenficpopupJS" />

                <link href="${mainCSS}" rel="stylesheet" />
                <script src="${diffStatsJS}"></script>
                <link href="${magneficPopupCSS}" rel="stylesheet" />
                <script src="${magenficpopupJS}"></script>
                <script type="text/javascript">
                    $(document).ready(function() {
                        /* $(this).tooltip(); */
                        $('[data-toggle="tooltip"]').tooltip();
                    });
                </script>
            </head>

            <body>

                <section>
                    <div id="content" align="center">
                        <form id="diffStatsForm" action="${pageContext.request.contextPath}/diffStats/getDiffStats" class="form-horizontal">
                            <div class="flexparent">
                                <div class="form-group">
                                    <label class="col-lg-5 control-label">Select Apks : </label>
                                    <div class="col-lg-5">
                                        <select id="apk" class="form-control">
                                            <c:forEach var="eachApk" items="${apks}">
                                                <option value=${eachApk}>${eachApk}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div>
                                    <input data-toggle="tooltip" data-placement="left" title="Get Diff data" value="Get Diff data" type="submit">
                                </div>
                            </div>
                        </form>
                        <div class="flexparent">
                            <div> The base apk taken for comparison is : <b>4.0.8.81</b></div>
                        </div>

                        <hr>
                        <div class="flexparent">
                        <div id="diffData">
                            <table border="1" class="table table-hover" style="display:hidden" id="diffTable">
                        <tr style="background: #3db2e1;">
                            <th>Percentile User</th>
                            <th>50th</th>
                            <th>80th</th>
                            <th>95th</th>
                            <th>99th</th>
                        </tr>
                        <tr>
                            <th>Chat Thread Opening</td>
                            <td id="50CO"></td>
                            <td id="80CO"></td>
                            <td id="95CO"></td>
                            <td id="99CO"></td>
                        </tr>

                        <tr>
                            <th>Chat Thread Scroll</td>
                            <td id="50CS"></td>
                            <td id="80CS"></td>
                            <td id="95CS"></td>
                            <td id="99CS"></td>
                        </tr>

                        <tr>
                            <th>App Force Stop</td>
                            <td id="50OC"></td>
                            <td id="80OC"></td>
                            <td id="95OC"></td>
                            <td id="99OC"></td>
                        </tr>

                        <tr>
                            <th>App Force Kill</td>
                            <td id="50OCR"></td>
                            <td id="80OCR"></td>
                            <td id="95OCR"></td>
                            <td id="99OCR"></td>
                        </tr>

                        <tr>
                            <th>Contact Loading time in Compose screen</td>
                            <td id="50COS"></td>
                            <td id="80COS"></td>
                            <td id="95COS"></td>
                            <td id="99COS"></td>
                        </tr>
                    </table>
                </div>
            </div>
                <div class="flexaparent">
                    <div><a href="#color-popup" class="open-popup-link">Click here for details behind the numbers and the color coding</a></div>
                </div>

                <div id="color-popup" class="white-popup mfp-hide">
                    The selected apk is compared with the base apk, <i>i.e.</i> <b>4.0.8.81</b>. The comparison is done for each percentile user across all actions. The difference percentage is calculated using the formula : ((Selected_version_value - base_version_value) / base_version_value) * 100 <br /> The <b>positive</b> value indicates an <b>increase</b> in reading and hence the color coding for the same is red (as there is an increase in performing the activity). Similarly, the <b>negative</b> value indicates a <b>decrease</b> in reading and hence the color coding for the same is green.
                </div>


            </body>

            </html>