{{strip}}
    <div data-role="page">
        <div data-role="header">
            <h1>{{$station->name|escape}}駅</h1>
            <a href="{{create_url route="train/stations"}}" data-icon="back" class="ui-btn-left" data-transition="slide" data-direction="reverse">駅選択</a>
        </div>
        <div data-role="content">
            <ul data-role="listview" data-inset="true">
                {{foreach from=$lines item=_line}}
                    <li>
                        <a href="{{create_url route="train/stationDia" id="`$input.id`" day="`$input.day`" line="`$_line->id`"}}">
                            {{$_line->name|escape}}
                        </a>
                    </li>
                {{/foreach}}
            </ul>
        </div>
    </div>
{{/strip}}
