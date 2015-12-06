http://qiita.com/tsuyopooon/items/8d32b2ebe015d805dc33

今回は上記の写経


自分のメモは下記

http://qiita.com/drafts/462ba83face0a3ab8352/edit


記事によれば

+ サード・パーティのcookbookはcookbook
+ 自作のcookbokはsite-cookbook

という構成が主流らしいのでこれを実践する

+ step01からコピーしたstep02にてbase-repoの削除
+ 新しくcookbookの作成
    + step01のcookbookの再現

```
$ cd step02/opsfiles
$ rm -rfv step1-repo/
$ chef generate repo step2-repo
$ vim step2-repo/Berksfile
```

```text:step2-repo/Berksfile
source "https://supermarket.chef.io"

cookbook 'timezone-ii', git: "https://github.com/L2G/timezone-ii.git"
```

```
$ cd step2-repo
$ berks vendor cookbooks
$ vim roles/common.json
```

```roles/common.json
{
  "name": "common",
  "chef_type": "role",
  "json_class": "Chef::Role",
  "default_attributes": {
    "tz": "Asia/Tokyo"
  },
  "run_list": [
    "recipe[timezone-ii::rhel]"
  ]
}
```

### gitをインストールする

+ Berksfileに追記

```text:step2-repo/Berksfile

cookbook 'timezone-ii', git: "https://github.com/L2G/timezon    e-ii.git"

+ cookbook 'git'
```

+ Berksfileをupdateする
 
```
$ berks update
```


+ インストール

```text:cmd
$ cd step2-repo
$ berks vendor cookbooks
```

+ common.jsonのrun_listに追加

```text:step2-repo/common.json
"run_list": [
  "recipe[timezone-ii::rhel]"
+ ,"recipe[git]"
  ]
```

