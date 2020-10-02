# huawei_e5180_api [![Build Status](https://travis-ci.org/pr0d1r2/huawei_e5180_api.svg?branch=master)](https://travis-ci.org/pr0d1r2/huawei_e5180_api)

Api support for Huawei E5180 LTE modem in ruby.

## Why?

As mobile companies give shitty data cap of 100GB on "unlimited" plans (after which you land with 2M/384k connection) we want to know internet usage distribution.

## Setup

Install gem:
```gem install huawei_e5180_api```

Put this into your Gemfile:
```gem 'huawei_e5180_api'```


## Usage:

```
require 'huawei_e5180_api'

agent = HuaweiE5180Api.new
while true
  stats = agent.traffic_statistics
  # here save stats to database for further analysis
  sleep 5
end
```

Also see specs.

## Contributing to huawei_e5180_api

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## License

MIT. Copyright (c) 2015-2020 Marcin Nowicki. See LICENSE for further details.
