I18n.translations || (I18n.translations = {});
I18n.translations["en"] = I18n.extend((I18n.translations["en"] || {}), {"aaa":"bbb en","breadcrumbs":{"application":{"root":"Index"},"pages":{"pages":"Pages"}},"errors":{"connection_refused":"Oops! Failed to connect to the Web Console middleware.\nPlease make sure a rails development server is running.\n","unacceptable_request":"A supported version is expected in the Accept header.\n","unavailable_session":"Session %{id} is is no longer available in memory.\n\nIf you happen to run on a multi-process server (like Unicorn or Puma) the process\nthis request hit doesn't store %{id} in memory. Consider turning the number of\nprocesses/workers to one (1) or using a different server in development.\n"},"helpers":{"actions":"Actions","links":{"back":"Back","cancel":"Cancel","confirm":"Are you sure?","destroy":"Delete","edit":"Edit","new":"New"},"titles":{"delete":"Delete %{model}","edit":"Edit %{model}","new":"New %{model}","save":"Save %{model}"}}});
I18n.translations["de"] = I18n.extend((I18n.translations["de"] || {}), {"aaa":"bbb de","breadcrumbs":{"application":{"root":"Index"},"pages":{"pages":"Pages"}},"helpers":{"actions":"Actions","links":{"back":"Back","cancel":"Cancel","confirm":"Are you sure?","destroy":"Delete","edit":"Edit","new":"New"},"titles":{"delete":"Delete %{model}","edit":"Edit %{model}","new":"New %{model}","save":"Save %{model}"}}});
