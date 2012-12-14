{{strip}}
    <div data-role="page">
        <div data-role="header">
            <h1>駅選択</h1>
            <a href="{{create_url route="train/index"}}" data-icon="back" class="ui-btn-left"  data-transition="slide" data-direction="reverse">トップ</a>
            <a href="javascript:startGeoLocation();" data-icon="gear" class="ui-btn-right">現在位置</a>
        </div>
        <div data-role="content">
            <div data-role="collapsible-set" data-inset="false" data-theme="a">
                {{foreach from=$lines item=_line}}
                    <div data-role="collapsible" data-collapsed="{{if $_line->id === 20}}false{{else}}true{{/if}}">
                        <h3>
                            {{$_line->name|escape}}
                        </h3>
                        {{if $_line->id !== 20}}
                            <ul data-role="listview" data-inset="true">
                                {{foreach from=$_line->stations item=_station}}
                                    <li>
                                        <a href="{{create_url route="train/station" id="`$_station->id`" line="`$_line->id`"}}" data-transition="slide">
                                            {{$_station->name|escape}}
                                        </a>
                                    </li>
                                {{/foreach}}
                            </ul>
                        {{else}}
                            <ul data-role="listview" data-inset="true" style="width:47.5%;float:left;margin-right:5%">
                                {{foreach from=$_line->stations item=_station}}
                                    {{if $_station->is_principal}}
                                        <li>
                                            <a href="{{create_url route="train/station" id="`$_station->id`" line="`$_line->id`"}}" data-transition="slide">
                                                {{$_station->name|escape}}
                                            </a>
                                        </li>
                                    {{/if}}
                                {{/foreach}}
                            </ul>
                            <ul data-role="listview" data-inset="true" style="width:47.5%;float:left">
                                {{foreach from=$_line->stations item=_station}}
                                    {{if !$_station->is_principal}}
                                        <li>
                                            <a href="{{create_url route="train/station" id="`$_station->id`" line="`$_line->id`"}}" data-transition="slide">
                                                {{$_station->name|escape}}
                                            </a>
                                        </li>
                                    {{/if}}
                                {{/foreach}}
                            </ul>
                            <div style="clear:left;"></div>
                        {{/if}}
                    </div>
                {{/foreach}}
            </div>
        </div>
    </div>
{{/strip}}
