<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%@page session="true" %>


 <div>
         <h2>All Person Details</h2>



         <table border="1px" bordercolor="black" width=80% align="center">
               <tr>
                             <td>First Name</td>
                             <td>Last Name</td>
                             <td>Address</td>
                             <td>Date of Birth</td>
                             <td>Action</td>

               </tr>
               <c:forEach items="${persons}" var="person">

                     <tr>
                       <td><c:out value="${person.firstName}" /></td>
                       <td><c:out value="${person.lastName}" /></td>

                       <td><c:out value="${person.address}" /></td>

                       <td><c:out value="${person.dateOfBirth}" /></td>

                       <td><a href="deletePerson/${person.id}">Delete</a>
                           <a href="updatePerson/${person.id}">Edit</a>

                       </td>



                     </tr>

               </c:forEach>
         </table>

         <a class="navbar-brand" href="/sample/personProfile">Back</a>
 </div>