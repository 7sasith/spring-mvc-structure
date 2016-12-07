       <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
       <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
       <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

       <%@page session="true" %>

       <tiles:insertDefinition name="defaultTemplate">
           <tiles:putAttribute name="body">
               <div>

                   <a class="navbar-brand" href="/sample/personProfile">Back</a>
               </div>

               <table border="1px" bordercolor="black" width=80% align="center">
                              <tr>
                                            <td>Username</td>
                                            <td>Enable</td>
                                            <td>Address</td>
                                            <td>Date of Birth</td>


                              </tr>


                                    <tr>
                                      <td><c:out value="${firstName}" /></td>
                                      <td><c:out value="${lastName}" /></td>

                                      <td><c:out value="${address}" /></td>

                                      <td><c:out value="${dateOfBirth}" /></td>





                                    </tr>


                        </table>


           </tiles:putAttribute>
       </tiles:insertDefinition>