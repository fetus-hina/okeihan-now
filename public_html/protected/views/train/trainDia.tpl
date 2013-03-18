{{strip}}
    <div data-role="page">
        <div data-role="header">
            <h1>{{$dia->number|escape}} 列車</h1>
            <a href="javascript:history.back();" data-icon="back" class="ui-btn-left" data-direction="reverse">戻る</a>
            <a href="{{create_url route="train/index" dia="`$dia->id`"}}" data-icon="check" class="ui-btn-right">乗車する</a>
        </div>
        <div data-role="content">
            <table class="traindia">
                <tbody>
                    <tr>
                        <th colspan="2">列車番号</th>
                        <td>{{$dia->number|escape}}</td>
                    </tr>
                    <tr>
                        <th colspan="2">列車種別</th>
                        <td class="type_{{$dia->type_id|escape}}">
                            {{$dia->type->name|escape}}
                            {{if $dia->type->id === 550}}
                                &#32;おりひめ
                            {{elseif $dia->type->id === 560}}
                                &#32;ひこぼし
                            {{elseif $dia->type->id === 930}}
                                &#32;洛楽
                            {{/if}}
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">運転日</th>
                        <td>
                            {{if $dia->weekday && $dia->holiday}}
                                毎日
                            {{elseif $dia->weekday}}
                                平日
                            {{else}}
                                土曜・休日
                            {{/if}}
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">運転区間</th>
                        <td>{{$dia->starting->name|escape}} → {{$dia->terminal->name|escape}}</td>
                    </tr>
                    <tr class="inforow">
                        <th colspan="2">駅</th>
                        <th>時刻</th>
                    </tr>
                    {{if $dia->weekday}}
                        {{assign var="_day" value="weekday"}}
                    {{else}}
                        {{assign var="_day" value="holiday"}}
                    {{/if}}
                    {{foreach from=$dia->times item=_time}}
                        <tr class="stationrow">
                            <th>
                                {{$_time->station->name|escape}}
                            </th>
                            <th class="timetable">
                                <a href="{{create_url route="train/stationDia" id="`$_time->station->id`" day="`$_day`"}}" data-icon="grid" data-role="button" data-iconpos="notext" data-mini="true" data-inline="true">
                                    駅時刻表
                                </a>
                            </th>
                            <td class="time">
                                {{if $_time->station->id == $dia->terminal->id}}
                                    {{$_time->arrive_at|date_format:'%H:%M'|escape}} 着
                                {{else}}
                                    {{$_time->departure_at|date_format:'%H:%M'|escape}} 発
                                {{/if}}
                            </td>
                        </tr>
                    {{/foreach}}
                </tbody>
            </table>
            <p>
                <a href="{{create_url route="train/index" dia="`$dia->id`"}}" data-role="button">
                    乗車する
                </a>
            </p>
        </div>
    </div>
{{/strip}}
