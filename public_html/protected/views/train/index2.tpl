{{strip}}
    <div data-role="page" id="main">
        <div data-role="header">
            <h1>おけいはんなう</h1>
            <a href="{{create_url route="train/index"}}" data-icon="back" class="ui-btn-left" data-direction="reverse">トップ</a>
            <a href="{{create_url route="train/stations"}}" data-icon="search" class="ui-btn-right">ダイヤ選択</a>
        </div>
        <div data-role="content">
            {{if $errors}}
                <ul class="error">
                    {{foreach from=$errors item=_texts}}
                        {{foreach from=$_texts item=_text}}
                            <li>{{$_text|escape}}</li>
                        {{/foreach}}
                    {{/foreach}}
                </ul>
            {{/if}}
            <form action="{{create_url route="train/tweet"}}" method="GET" data-ajax="false" target="_blank">
                <table style="width:100%;">
                    <tbody>
                        <tr>
                            <th style="width:5em;">車両番号</th>
                            <td><input type="text" name="car_number" value="{{$input.car_number|default:''|escape}}" placeholder="例) 8801" required pattern="\d|\d{4,5}"></td>
                        </tr>
                        <tr>
                            <th style="width:5em;">列車番号</th>
                            <td><input type="text" name="train_number" value="{{$input.train_number|default:''|escape}}" readonly></td>
                        </tr>
                        <tr>
                            <th>編成詳細</th>
                            <td>
                                <select name="form_detail" id="form_detail" data-role="slider">
                                    <option value="off"{{if $input.form_detail === 'off'}} selected{{/if}}>書かない</option>
                                    <option value="on"{{if $input.form_detail !== 'off'}} selected{{/if}}>書く</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding-bottom:60px;">
                                <input type="hidden" name="dia" value="{{$input.dia|escape}}">
                                <input type="submit" value="ツイート" data-theme="e">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <p>
                お知らせ：(2015-04-15)<br>
                システムの構成を大きく変更したため、何か起きているかもしれません。<br>
                <a href="https://github.com/fetus-hina/okeihan-now/issues/21">↑に伴って、ダイヤ検索の一部機能が動作していませんでした</a>。<br>
                <a href="https://github.com/fetus-hina/okeihan-now/issues/22">↑に伴って、リンクのURLが壊れていました</a>。(2014-04-17)
            </p>
            <p>
                お知らせ：(2015-04-13)<br>
                <a href="https://github.com/fetus-hina/okeihan-now/issues/17">鋼索線（男山ケーブル）のダイヤが重複している問題（春ダイヤ関連）</a>に対処しました。<br>
                <a href="https://github.com/fetus-hina/okeihan-now/issues/18">鋼索線（男山ケーブル）の車両の番号「1」「2」が受け付けられない問題</a>に対処しました。<br>
                <a href="https://github.com/fetus-hina/okeihan-now/issues/19">7201Fの編成が変更されている件</a>、その他現在の編成と異なる件に対処しました。
            </p>
            <p>
                バグ報告は <a href="https://github.com/fetus-hina/okeihan-now/issues">GitHub</a> か <a href="https://twitter.com/fetus_hina">@fetus_hina</a> まで。
            </p>
            <p>
                <a href="http://ekimemo.com/">駅メモ</a>はじめました。招待コードは <code>bj1at7ty</code> です。
            </p>
        </div>
    </div>
{{/strip}}
