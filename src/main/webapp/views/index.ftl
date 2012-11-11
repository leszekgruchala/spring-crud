<#import "/spring.ftl" as spring />
<#include "macros/personFormInput.ftl"/>
<!DOCTYPE HTML>
<html>
<head>
    <title>Spring CRUD example</title>
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <link href="resources/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery-1.8.2.min.js"></script>
    <script src="resources/js/code.js"></script>
</head>
<body>
<div class="container">
    <h2>Hello from Spring CRUD example</h2>
    <form id="mainForm" class=".form-inline" action="savePerson" method="POST">
        <label>Please add a person :-)</label>
        <@personFormInput bean="person"/>
    </form>
    <input type="hidden" id="currentlyEditedPerson" value="${currentlyEditedPerson!''}">
    <h3>People history</h3>
    <ul class="unstyled prettyprint">
    <#if (people?? && people?size != 0)>
        <#list people as persona>
            <li class="person-row">
                <label class="force-middle">${persona.name} / ${persona.formattedBirthDate} / ${persona.email}</label>
                <div class="force-middle">
                    <input type="hidden" class="personId" value="${persona.id}">
                    <input type="hidden" class="personName" value="${persona.name}">
                    <input type="hidden" class="personBirthDate" value="${persona.formattedBirthDate}">
                    <input type="hidden" class="personEmail" value="${persona.email}">
                    <i class="icon-edit" title="Edit person"></i>
                    <i class="icon-remove" title="Remove person"></i>
                </div>
            </li>
        </#list>
    <#else>
        No people around.
    </#if>
        <form id="editPersonFrom" class=".form-inline hide" action="editPerson" method="POST">
            <@personFormInput bean="editablePerson" withCancel=true/>
        </form>
        <form name="removePerson" id="removePerson" class=".form-inline hide" action="removePerson/" method="POST">
        <#--do nothing, see code.js-->
        </form>
    </ul>
</div>
</body>
</html>