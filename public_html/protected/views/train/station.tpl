{{strip}}
    <div data-role="page">
        <div data-role="header">
            <h1>{{$station->name|escape}}駅</h1>
            <a href="{{create_url route="train/stations"}}" data-icon="back" class="ui-btn-left" data-direction="reverse">駅選択</a>
            <a href="{{create_url route="train/stationDia" id="`$station->id`" day="`$input.day`"}}" data-icon="grid" class="ui-btn-right">駅時刻表</a>
        </div>
        <div data-role="content">
            <div data-role="controlgroup" data-type="horizontal">
                <a href="{{create_url route="train/station" id="`$station->id`" line="`$input.line`" day="weekday"}}" data-role="button" class="{{if $input.day !== 'holiday'}}ui-btn-active{{/if}}">
                    平日ダイヤ
                </a>
                <a href="{{create_url route="train/station" id="`$station->id`" line="`$input.line`" day="holiday"}}" data-role="button" class="{{if $input.day === 'holiday'}}ui-btn-active{{/if}}">
                    休日ダイヤ
                </a>
            </div>

            {{foreach from=$lines item=_line}}
                {{if $_line->nobori}}
                    <div data-role="collapsible" data-collapsed="{{if $input.line == '' || $input.line == $_line->info->id}}false{{else}}true{{/if}}" data-theme="a">
                        <h3>
                            {{$_line->info->name|escape}} (上り)
                        </h3>
                        <ul data-role="listview" data-inset="true">
                            {{foreach from=$_line->nobori item=_time}}
                                <li>
                                    <a href="{{create_url route="train/index" dia="`$_time->dia->id`"}}">
                                        <span class="type_{{$_time->dia->type->id|escape}}">
                                            {{$_time->departure_at|date_format:'%H:%M'|escape}}
                                            &#32;
                                            {{$_time->dia->type->name_ui|escape}}
                                            &#32;
                                            {{$_time->dia->terminal->name|escape}}
                                            &#32;
                                            [{{$_time->dia->number|escape}}]
                                        </span>
                                    </a>
                                    <a href="{{create_url route="train/trainDia" id="`$_time->dia->id`"}}" data-icon="info" data-theme="d">
                                        ダイヤ
                                    </a>
                                </li>
                            {{/foreach}}
                        </ul>
                    </div>
                {{/if}}
                {{if $_line->kudari}}
                    <div data-role="collapsible" data-collapsed="{{if $input.line == '' || $input.line == $_line->info->id}}false{{else}}true{{/if}}" data-theme="a">
                        <h3>
                            {{$_line->info->name|escape}} (下り)
                        </h3>
                        <ul data-role="listview" data-inset="true">
                            {{foreach from=$_line->kudari item=_time}}
                                <li>
                                    <a href="{{create_url route="train/index" dia="`$_time->dia->id`"}}">
                                        <span class="type_{{$_time->dia->type->id|escape}}">
                                            {{$_time->departure_at|date_format:'%H:%M'|escape}}
                                            &#32;
                                            {{$_time->dia->type->name_ui|escape}}
                                            &#32;
                                            {{$_time->dia->terminal->name|escape}}
                                            &#32;
                                            [{{$_time->dia->number|escape}}]
                                        </span>
                                    </a>
                                    <a href="{{create_url route="train/trainDia" id="`$_time->dia->id`"}}" data-icon="info" data-theme="d">
                                        列車ダイヤ
                                    </a>
                                </li>
                            {{/foreach}}
                        </ul>
                    </div>
                {{/if}}
            {{/foreach}}
        </div>
    </div>
{{/strip}}
