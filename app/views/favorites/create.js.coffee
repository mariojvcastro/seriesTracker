$("#favourite").replaceWith '''

<a href="/favorites/destroy?series_id='''  + $("h2#series_name").data('seriesid')  +  '''" data-method="post" data-remote="true" id="unfavourite" rel="nofollow" STYLE="border-bottom-style: none; border-bottom-width: 0px;"><img alt="Star_delete" src="/assets/star_delete.png">
</a>

'''

