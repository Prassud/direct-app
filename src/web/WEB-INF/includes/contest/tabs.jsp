<%--
  - Author: isv
  - Version: 1.1
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page fragment renders the tabs for dashboard and contest pages.
  -
  - Version 1.1 (Submission Viewer Release 1 assembly) changes: linked Submissions tab to submission pages
  - for Studio contests.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/taglibs.jsp" %>
<s:set var="contestStats" value="viewData.contestStats" scope="page"/>
<s:push value="viewData.contestStats">
    <div id="tabs3">
        <ul>
            <li class="firstItem <c:if test="${requestScope.CURRENT_SUB_TAB eq 'details'}">on</c:if>">

                <s:if test="isStudio == true">
                    <a href="<s:url action="contest/detail" namespace="/"><s:param name="contestId" value="contest.id"/></s:url>" class="first">
                    <span class="left"><span class="right">Details</span></span></a>
                </s:if>
                <s:if test="isStudio == false">
                    <a href="<s:url action="contest/detail" namespace="/"><s:param name="projectId" value="contest.id"/></s:url>" class="first">
                    <span class="left"><span class="right">Details</span></span></a>
                </s:if>
            </li>
            <li <c:if test="${requestScope.CURRENT_SUB_TAB eq 'registrants'}">class="on"</c:if>>

                 <s:if test="isStudio == true">
                    <a href="<s:url action="contest/contestRegistrants" namespace="/"><s:param name="contestId" value="contest.id"/></s:url>">
                    <span class="left"><span class="right">Registrants (<s:property value="registrantsNumber"/>)</span></span></a>
                </s:if>
                <s:if test="isStudio == false">
                    <a href="<s:url action="contest/contestRegistrants" namespace="/"><s:param name="projectId" value="contest.id"/></s:url>">
                    <span class="left"><span class="right">Registrants (<s:property value="registrantsNumber"/>)</span></span></a>
                </s:if>
            </li>
            <li <c:if test="${requestScope.CURRENT_SUB_TAB eq 'submissions'}">class="on"</c:if>>
                <if:isStudioContest contestStats="${contestStats}">
                    <link:studioSubmissionsGrid contestId="${contestStats.contest.id}">
                        <span class="left">
                            <span class="right">Submissions (<s:property value="submissionsNumber"/>)</span>
                        </span>
                    </link:studioSubmissionsGrid>
                </if:isStudioContest>
                <if:isStudioContest contestStats="${contestStats}" negate="true">
                    <link:softwareSubmissionsList contestId="${contestStats.contest.id}">
                        <span class="left">
                            <span class="right">Submissions (<s:property value="submissionsNumber"/>)</span>
                        </span>
                    </link:softwareSubmissionsList>
                </if:isStudioContest>
            </li>
        </ul>
    </div>
    <!-- End #tabs3 -->
</s:push>
