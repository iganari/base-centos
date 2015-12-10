http://qiita.com/tsuyopooon/items/d90679d9f8b5ccfcfde5#fn2

これのほぼ写経


自分のメモは下記

http://qiita.com/drafts/462ba83face0a3ab8352/edit


```
$ cd opsfiles
$ chef generate repo step1-repo
```
```
$ vim step1-repo/Berksfile
```

```text:step1-repo/Berksfile
source "https://supermarket.chef.io"

cookbook 'timezone-ii', git: "https://github.com/L2G/timezone-ii.git"
```


```
$ cd step1-repo/
$ berks vendor cookbooks
```

```
$ vim step1-repo/roles/common.json
```

```
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


+ Vagrantfileに書き足し

```
  ### install of chef recipe
    config.omnibus.chef_version=:latest
    config.vm.provision  "chef_zero" do |chef|
      chef.cookbooks_path = "./step1-repo/cookbooks"
      chef.roles_path = "step1-repo/roles"
      chef.add_role "common"
    end
```


+ vagrant実行

上記の設定が終わったら、下記を実行

```
$ cd opsfiles
$ vagrant up
```

### 確認

+ Vagrantfileの書き足し部分をコメントアウトして、動作の違いを見てみる

+ コメントアウト無し

```
$ vagrant ssh
[vagrant@vagrant-svr ~]$ date
Mon Oct 26 22:00:09 JST 2015
```

+ コメントアウト

```
$ vagrant ssh
[vagrant@vagrant-svr ~]$ date
Mon Oct 26 12:54:17 UTC 2015
```
