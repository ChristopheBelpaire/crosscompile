# Crosscompile

To compile for linux/amd64 :

```docker build --platform linux/amd64 .```


It fails : 


```
 > [builder  6/17
  RUN mix deps.get --only prod:
1.213
1.213 09:35:18.326 [notice] Application ssl exited: exited in: :ssl_app.start(:normal, [])
1.213     ** (EXIT) an exception was raised:
1.213         ** (ArgumentError) could not call Module.put_attribute/3 because the module Crosscompile.MixProject is already compiled
1.213             (elixir 1.16.2) lib/module.ex:2360: Module.assert_not_readonly!/2
1.213             (elixir 1.16.2) lib/module.ex:2041: Module.__put_attribute__/5
1.213             (ssl 11.0.3) ssl_app.erl:35: :ssl_app.stop/1
1.213             (kernel 9.1) application_master.erl:293: :application_master.start_it_old/4
1.213
1.213 09:35:18.338 [notice] Application public_key exited: :stopped
1.213
1.213 09:35:18.338 [notice] Application asn1 exited: :stopped
1.213
1.213 09:35:18.339 [notice] Application crypto exited: :stopped
1.216 Could not start Hex. Try fetching a new version with "mix local.hex" or uninstalling it with "mix archive.uninstall hex.ez"
1.226 ** (MatchError) no match of right hand side value: {:error, {:ssl, {:bad_return, {{:ssl_app, :start, [:normal, []]}, {:EXIT, {%ArgumentError{message: "could not call Module.put_attribute/3 because the module Crosscompile.MixProject is already compiled"}, [{Module, :assert_not_readonly!, 2, [file: ~c"lib/module.ex", line: 2360]}, {Module, :__put_attribute__, 5, [file: ~c"lib/module.ex", line: 2041]}, {:ssl_app, :stop, 1, [file: ~c"ssl_app.erl", line: 35]}, {:application_master, :start_it_old, 4, [file: ~c"application_master.erl", line: 293]}]}}}}}}
1.226     (hex 2.1.1) lib/hex.ex:5: Hex.start/0
1.226     (mix 1.16.2) lib/mix/hex.ex:60: Mix.Hex.start/0
1.226     (mix 1.16.2) lib/mix/dep/loader.ex:189: Mix.Dep.Loader.with_scm_and_app/5
1.226     (mix 1.16.2) lib/mix/dep/loader.ex:141: Mix.Dep.Loader.to_dep/4
1.226     (elixir 1.16.2) lib/enum.ex:1700: Enum."-map/2-lists^map/1-1-"/2
1.226     (mix 1.16.2) lib/mix/dep/loader.ex:364: Mix.Dep.Loader.mix_children/3
1.226     (mix 1.16.2) lib/mix/dep/loader.ex:18: Mix.Dep.Loader.children/1
1.226     (mix 1.16.2) lib/mix/dep/converger.ex:97: Mix.Dep.Converger.all/4
------
Dockerfile:39
--------------------
  37 |     # install mix dependencies
  38 |     COPY mix.exs mix.lock ./
  39 | >>> RUN mix deps.get --only $MIX_ENV
  40 |     RUN mkdir config
  41 |
--------------------
```