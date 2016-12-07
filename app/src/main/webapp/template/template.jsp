<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%--<link type="text/css" rel="stylesheet" href="<spring:url value='/resources/css/style.css' />" />--%>
    <link type="text/css" rel="stylesheet" href="<spring:url value='/resources/css/bootstrap.min.css' />"/>
    <link type="text/css" rel="stylesheet" href="<spring:url value='/resources/css/dashboard.css' />"/>
    <link type="text/css" rel="stylesheet" href="<spring:url value='/resources/css/jquery.dataTables.min.css' />"/>
    <link type="text/css" rel="stylesheet" href="<spring:url value='/resources/css/datepicker.css' />"/>
    <link type="text/css" rel="stylesheet" href="<spring:url value='/resources/css/datepicker.less' />"/>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="<spring:url value='/resources/script/html5shiv.js' />"></script>
    <script src="<spring:url value='/resources/script/respond.min.js' />"></script>
    <![endif]-->

    <style>
        .error {
            color: #ff0000;
        }

        .down_space{
            margin-bottom: 25px;
        }

        /*.msgWarn {
            margin-left: 350px;
            margin-bottom: -200px;
        }

        .msgSuccess {
            margin-left: 0px;
        }*/
    </style>
</head>

<body>


<div class="header">
    <tiles:insertAttribute name="header"/>
</div>
<div class="menu">
    <tiles:insertAttribute name="menu"/>
</div>
<div class="body">
    <tiles:insertAttribute name="body"/>
</div>
<div class="footer" align="center">
    <tiles:insertAttribute name="footer"/>
</div>
</body>

<script src="<spring:url value='/resources/script/jquery-1.11.3.min.js' />"></script>
<script src="<spring:url value='/resources/script/bootstrap.min.js' />"></script>
<script src="<spring:url value='/resources/script/jquery.dataTables.min.js' />"></script>
<script src="<spring:url value='/resources/script/bootstrap-datepicker.js' />"></script>
<script src="<spring:url value='/resources/script/jquery.balloon.js' />"></script>

<script type="text/javascript">
    /*$('#datepicker').datepicker().val();*/
    $('#datepicker').datepicker({
        format: 'dd-mm-yyyy'
    });
    $('#datepicker1').datepicker({
        format: 'dd-mm-yyyy'
    });

    /*$('#datepicker1').datepicker().val();*/


    $('#datepicker').on('changeDate', function (ev) {
        $(this).datepicker('hide');
        $('#warnMsg').hide();
    });
    $('#datepicker1').on('changeDate', function (ev) {
        $(this).datepicker('hide');
    });

    $(document).ready(function () {
        var text_max = 160;
        $('#textarea_feedback').html(text_max + ' characters remaining');

        $('#smsContent').keyup(function () {
            var text_length = $('#smsContent').val().length;
            var text_remaining = text_max - text_length;

            $('#textarea_feedback').html(text_remaining + ' characters remaining');
        });
    });


    $(document).ready(function () {
        $('#obj').dataTable();
    });


    function isNumber(evt) {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {

            return false;
        }

        return true;
    }
    $('#mobileNo').keyup(function () {
        if ($(this).val() === '0') {
            $(this).val('');
        }
    });

    $(function () {
        $("#mobileNo").balloon({
            contents: 'Please Enter a Phone Number<br>'
                    + '<label>Eg :- 94777678678</label>'

        });
    });

    $(function () {
        $("#btnBrowse").balloon({
            contents: 'Please choose a file<br>'
                    + '<label>Eg :- example.csv</label>'

        });
    });

</script>
</html>
