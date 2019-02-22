<#--

    Solo - A small and beautiful blogging system written in Java.
    Copyright (c) 2010-2019, b3log.org & hacpai.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->
<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
<head>
<@head title="${blogTitle}">
    <meta name="keywords" content="${metaKeywords},${dynamicLabel}"/>
    <meta name="description" content="${metaDescription},${dynamicLabel}"/>
</@head>
</head>
<body>
<#include "header.ftl">
<div class="main">
    <div id="pjax" class="content">
    <#if pjax><!---- pjax {#pjax} start ----></#if>
    <main>
        <div class="module">
            <div class="module__content ft__center">
                <i class="icon__home"></i>
                <a href="${servePath}" class="breadcrumb">${blogTitle}</a>
                &nbsp; > &nbsp;
                <i class="icon__refresh"></i> ${dynamicLabel}
            </div>
        </div>
    <#if 0 != recentComments?size>
        <ul class="comments">
            <#list recentComments as comment>
                <#include "common-comment.ftl"/>
            </#list>
        </ul>
    </#if>
    </main>
    <#if pjax><!---- pjax {#pjax} end ----></#if>
    </div>
<#include "side.ftl">
</div>
<#include "footer.ftl">
<script>
    var $commentContents = $('.comments .content-reset')
    for (var i = 0; i < $commentContents.length; i++) {
        var str = $commentContents[i].innerHTML
        $commentContents[i].innerHTML = Util.replaceEmString(str)
    }
</script>
</body>
</html>
