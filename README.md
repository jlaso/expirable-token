# ExpirableToken

I've found very useful this class to hide the parameters in the URL

it generates a hash very compact and auto-expirable

## How it works

In the object is store the creation date and the expiration date
and the differences between them as well.

When the hash/token is decoded the class detects if the dates match.

## Install in your project

Just require it in your Gemfile

```
gem 'expirable-token'
```

[![Gem Version](https://badge.fury.io/rb/expirable-token.svg)](https://badge.fury.io/rb/expirable-token)

[Visit Rubygems.org](https://rubygems.org/gems/expirable-token)