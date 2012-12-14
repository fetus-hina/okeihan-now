{{strip}}
    <div data-role="page">
        <div data-role="header">
            <h1>近くの駅</h1>
            <a href="{{create_url route="train/stations"}}" data-icon="back" class="ui-btn-left"  data-transition="slide" data-direction="reverse">駅選択</a>
        </div>
        <div data-role="content">
            <ul data-role="listview">
                {{foreach from=$stations item=_station}}
                    <li>
                        <a href="{{create_url route="train/station" id="`$_station->id`"}}" data-transition="slide">
                            {{$_station->name|escape}}
                            &#32;(
                            {{if $_station->distance <= 80}}
                                すぐそば
                            {{else}}
                                {{math assign="_distance" equation="ceil(d / 50) * 50" d="`$_station->distance`"}}
                                {{$_distance|number_format|escape}}m
                            {{/if}})
                        </a>
                    </li>
                {{foreachelse}}
                    {{if $input.error == 1}}
                        <li>
                            端末が位置情報取得に対応していません
                        </li>
                    {{elseif $input.error == 2}}
                        <li>
                            位置情報の取得に失敗しました
                        </li>
                    {{else}}
                        <li>
                            近くに京阪線の駅はありません
                        </li>
                    {{/if}}
                {{/foreach}}
            </ul>
        </div>
    </div>
{{/strip}}
