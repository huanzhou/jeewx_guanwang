SELECT * FROM weixin_cms_menu WHERE 1=1
<#if params.accountid ?exists && params.accountid ?length gt 0>
	and accountid = :params.accountid
</#if>
and (SHOW_FLAG <> 'N' OR SHOW_FLAG IS NULL)
ORDER BY ORDERS ASC