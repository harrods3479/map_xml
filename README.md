# バスMAPにマッピングするデータの生成

## 実行方法

``` 実行コマンド
ruby pg/convert.rb 読み込むcsvファイル名(乗車) 読み込むcsvファイル名(降車) 出力先ファイル名
```

``` 例
ruby pg/convert.rb data/togakushi_up.csv data/togakushi_down.csv output/togakushi.xml
```

``` 出力例
<?xml version="1.0" encoding="UTF-8"?>
<markers>
  <marker category="Attr_02" lat="36.656111" lng="138.186445" contact="善光寺西町" data="乗車3人"/>
  <marker category="Attr_01" lat="36.642993" lng="138.185918" contact="東横INN長野駅善光寺口" data="乗車1人"/>
  <marker category="Attr_02" lat="36.706725" lng="138.143273" contact="手打ちそば処飯綱本店" data="乗車2人"/>
  <marker category="Attr_04" lat="36.715992" lng="138.115375" contact="大久保の茶屋" data="乗車12人"/>
  <marker category="Attr_05" lat="36.726450" lng="138.086533" contact="戸隠そば博物館とんくるりん" data="降車1人"/>
  <marker category="Attr_05" lat="36.702989" lng="138.148828" contact="飯綱高原乗馬倶楽部" data="降車1人"/>
  <marker category="Attr_06" lat="36.651215" lng="138.181782" contact="長野県庁" data="降車2人"/>
  <marker category="Attr_06" lat="36.656608" lng="138.182353" contact="信大教育学部" data="降車2人"/>
</markers>
```

## 旧

``` 実行コマンド
ruby pg/convert_sep.rb 読み込むcsvファイル名 出力先ファイル名 {up or down}
```
