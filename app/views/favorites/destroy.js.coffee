$("#unfavourite").replaceWith '''

<a href="/favorites/create?series_id='''  + $("h2#series_name").data('seriesid')  +  '''" data-method="post" data-remote="true" id="favourite" rel="nofollow" STYLE="border-bottom-style: none; border-bottom-width: 0px;"><img alt="Star_add2" src="/assets/star_add2.png" ></a>
'''


