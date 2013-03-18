{{strip}}
    <div data-role="page">
        <div data-role="header">
            <h1>{{$station->name|escape}}駅</h1>
            {{if $lines > 1}}
                <a href="{{create_url route="train/stationDia" id="`$input.id`" day="`$input.day`"}}" data-icon="back" class="ui-btn-left" data-direction="reverse">路線選択</a>
            {{else}}
                <a href="{{create_url route="train/stations" line="`$input.line`"}}" data-icon="back" class="ui-btn-left" data-direction="reverse">駅選択</a>
            {{/if}}
        </div>
        <div data-role="content" class="station-dia">
            <div data-role="controlgroup" data-type="horizontal">
                <a href="{{create_url route="train/stationDia" id="`$station->id`" day="weekday" line="`$input.line`"}}" data-role="button" class="{{if $input.day !== 'holiday'}}ui-btn-active{{/if}}">
                    平日ダイヤ
                </a>
                <a href="{{create_url route="train/stationDia" id="`$station->id`" day="holiday" line="`$input.line`"}}" data-role="button" class="{{if $input.day === 'holiday'}}ui-btn-active{{/if}}">
                    休日ダイヤ
                </a>
            </div>
            {{if $nobori}}
                <h3>
                    {{$line->name|escape}} (上り)
                </h3>
                <div class="timetable {{if $input.day === 'holiday'}}timetable-holiday{{else}}timetable-weekday{{/if}}">
                    <h4>
                        {{if $input.day === 'holiday'}}
                            土曜・休日 Saturdays &amp; Holidays
                        {{else}}
                            平日 Weekdays
                        {{/if}}
                    </h4>
                    <div class="table-wrap">
                        <table>
                            <tbody>
                                {{assign var="_last_hour" value=""}}
                                {{foreach from=$nobori item=_time name=hoge}}
                                    {{if $_last_hour !== $_time->departure_at|substr:0:2}}
                                        {{assign var="_last_hour" value="`$_time->departure_at|substr:0:2`"}}
                                        {{if !$smarty.foreach.hoge.first}}
                                            </td></tr>
                                        {{/if}}
                                        <tr class="{{if $_last_hour%2==0}}even{{else}}odd{{/if}}">
                                        <th>{{$_time->departure_at|substr:0:2|escape}}</th><td>
                                    {{else}}
                                        &#32;
                                    {{/if}}
                                    <a href="{{create_url route="train/trainDia" id="`$_time->dia->id`"}}" class="type_{{$_time->dia->type->id|escape}}" data-role="button" data-inline="true" data-mini="true" data-corners="false">
                                        {{$_time->departure_at|substr:3:2|escape}}
                                    </a>
                                    {{if $smarty.foreach.hoge.last}}
                                        </td></tr>
                                    {{/if}}
                                {{/foreach}}
                            </tbody>
                        </table>
                    </div>
                </div>
            {{/if}}
            {{if $kudari}}
                <h3>
                    {{$line->name|escape}} (下り)
                </h3>
                <div class="timetable {{if $input.day === 'holiday'}}timetable-holiday{{else}}timetable-weekday{{/if}}">
                    <h4>
                        {{if $input.day === 'holiday'}}
                            土曜・休日 Saturdays &amp; Holidays
                        {{else}}
                            平日 Weekdays
                        {{/if}}
                    </h4>
                    <div class="table-wrap">
                        <table>
                            <tbody>
                                {{assign var="_last_hour" value=""}}
                                {{foreach from=$kudari item=_time name=hoge}}
                                    {{if $_last_hour !== $_time->departure_at|substr:0:2}}
                                        {{assign var="_last_hour" value="`$_time->departure_at|substr:0:2`"}}
                                        {{if !$smarty.foreach.hoge.first}}
                                            </td></tr>
                                        {{/if}}
                                        <tr class="{{if $_last_hour%2==0}}even{{else}}odd{{/if}}">
                                        <th>{{$_time->departure_at|substr:0:2|escape}}</th><td>
                                    {{else}}
                                        &#32;
                                    {{/if}}
                                    <a href="{{create_url route="train/trainDia" id="`$_time->dia->id`"}}" class="type_{{$_time->dia->type->id|escape}}" data-role="button" data-inline="true" data-mini="true" data-corners="false">
                                        {{$_time->departure_at|substr:3:2|escape}}
                                    </a>
                                    {{if $smarty.foreach.hoge.last}}
                                        </td></tr>
                                    {{/if}}
                                {{/foreach}}
                            </tbody>
                        </table>
                    </div>
                </div>
            {{/if}}
        </div>
    </div>
{{/strip}}
