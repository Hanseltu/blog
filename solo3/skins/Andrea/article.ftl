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
<#include "macro-comments.ftl">
<#include "../../common-template/macro-comment_script.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${article.articleTitle} - ${blogTitle}">
        <meta name="keywords" content="${article.articleTags}" />
        <meta name="description" content="${article.articleAbstract?html}" />
        </@head>
        <#if previousArticlePermalink??>
            <link rel="prev" title="${previousArticleTitle}" href="${servePath}${previousArticlePermalink}">
        </#if>
        <#if nextArticlePermalink??>
            <link rel="next" title="${nextArticleTitle}" href="${servePath}${nextArticlePermalink}">
        </#if>
            <!-- Open Graph -->
            <meta property="og:locale" content="zh_CN"/>
            <meta property="og:type" content="article"/>
            <meta property="og:title" content="${article.articleTitle}"/>
            <meta property="og:description" content="${article.articleAbstract?html}"/>
            <meta property="og:image" content="${article.authorThumbnailURL}"/>
            <meta property="og:url" content="${servePath}${article.articlePermalink}"/>
            <meta property="og:site_name" content="Solo"/>
            <!-- Twitter Card -->
            <meta name="twitter:card" content="summary"/>
            <meta name="twitter:description" content="${article.articleAbstract?html}"/>
            <meta name="twitter:title" content="${article.articleTitle}"/>
            <meta name="twitter:image" content="${article.authorThumbnailURL}"/>
            <meta name="twitter:url" content="${servePath}${article.articlePermalink}"/>
            <meta name="twitter:site" content="@DL88250"/>
            <meta name="twitter:creator" content="@DL88250"/>
    </head>
    <body>
        ${topBarReplacement}
        <#include "side-tool.ftl">
        <div class="wrapper">
            <#include "header.ftl">
            <div>
                <div class="main">
                    <div class="main-content">
                        <div class="article">
                            <div class="date">
                                <div class="month">${article.articleCreateDate?string("MM")}</div>
                                <div class="day">${article.articleCreateDate?string("dd")}</div>
                            </div>
                            <div class="left">
                                <h2 class="article-title">
                                    <a class="no-underline" href="${servePath}${article.articlePermalink}">${article.articleTitle}</a>
                                    <#if article.hasUpdated>
                                    <sup class="red">
                                        ${updatedLabel}
                                    </sup>
                                    </#if>
                                    <#if article.articlePutTop>
                                    <sup class="red">
                                        ${topArticleLabel}
                                    </sup>
                                    </#if>
                                </h2>
                                <div class="article-date">
                                    <#if article.hasUpdated>
                                    ${article.articleUpdateDate?string("yyyy HH:mm:ss")}
                                    <#else>
                                    ${article.articleCreateDate?string("yyyy HH:mm:ss")}
                                    </#if>
                                    by
                                    <a rel="nofollow" title="${article.authorName}" href="${servePath}/authors/${article.authorId}">
                                        ${article.authorName}</a> |
                                    <a rel="nofollow" href="${servePath}${article.articlePermalink}#comments">
                                        ${article.articleCommentCount}${commentLabel}
                                    </a>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <div class="article-body">
                                ${article.articleContent}
                                <#if "" != article.articleSign.signHTML?trim>
                                <div class="marginTop12">
                                    ${article.articleSign.signHTML}
                                </div>
                                </#if>
                            </div>
                            <div class="right">
                                ${tag1Label}
                                <#list article.articleTags?split(",") as articleTag>
                                <span>
                                    <a rel="tag" href="${servePath}/tags/${articleTag?url('UTF-8')}">
                                        ${articleTag}</a><#if articleTag_has_next>,</#if>
                                </span>
                                </#list>
                                &nbsp;&nbsp;${viewCount1Label}
                                <a rel="nofollow" href="${servePath}${article.articlePermalink}">
                                    ${article.articleViewCount}
                                </a>
                            </div>
                            <div class="clear"></div>
                            <div>
                                <#if nextArticlePermalink??>
                                <a href="${servePath}${nextArticlePermalink}">${nextArticle1Label}${nextArticleTitle}</a>
                                <br>
                                </#if>
                                <#if previousArticlePermalink??>
                                <a href="${servePath}${previousArticlePermalink}">${previousArticle1Label}${previousArticleTitle}</a>
                                </#if>
                            </div>
                            <div id="relevantArticles" class="article-relative left relevantArticles"></div>
                            <div id="randomArticles"  class="article-relative left"></div>
                            <div class="clear"></div>
                            <div id="externalRelevantArticles" class="article-relative"></div>
                        </div>
                        <@comments commentList=articleComments article=article></@comments>
                    </div>
                    <div class="main-footer"></div>
                </div>
                <div class="side-navi">
                    <#include "side.ftl">
                </div>
                <div class="clear"></div>
                <div class="brush">
                    <div class="brush-icon"></div>
                    <div id="brush"></div>
                </div>
                <div class="footer">
                    <#include "footer.ftl">
                </div>
            </div>
        </div>
        <@comment_script oId=article.oId commentable=article.commentable>
        page.tips.externalRelevantArticlesDisplayCount = "${externalRelevantArticlesDisplayCount}";
         <#if 0 != randomArticlesDisplayCount>
        page.loadRandomArticles();
        </#if>
        <#if 0 != relevantArticlesDisplayCount>
        page.loadRelevantArticles('${article.oId}', '<h4>${relevantArticles1Label}</h4>');
        </#if>
        <#if 0 != externalRelevantArticlesDisplayCount>
        page.loadExternalRelevantArticles("<#list article.articleTags?split(",") as articleTag>${articleTag}<#if articleTag_has_next>,</#if></#list>");
        </#if>
        </@comment_script>    
    </body>
</html>
