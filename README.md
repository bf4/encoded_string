# EncodedString

EncodedString is a wrapper for a string and a given encoding that handles operations on
strings with different encodings, invalid encodings, have no known conversion method,
or are otherwise incompatible, all without raising excpetions

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'encoded_string'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install encoded_string

## Usage

```ruby
EncodedString.pick_encoding(str1, str2)

string = "123".force_encoding(EncodedString::UTF_8)
str = "abc".encode('ASCII-8BIT')
str = EncodedString.new(str, target_encoding = string.encoding)
str.source_encoding.to_s
str.split("\n")
str << "123"
str.to_s
```

## About

Encoding Exceptions:

```plain
Raised by Encoding and String methods:
  Encoding::UndefinedConversionError:
    when a transcoding operation fails
    if the String contains characters invalid for the target encoding
    e.g. "\x80".encode('UTF-8','ASCII-8BIT')
    vs "\x80".encode('UTF-8','ASCII-8BIT', undef: :replace, replace: '<undef>')
    # => '<undef>'
  Encoding::CompatibilityError
    when Encoding.compatibile?(str1, str2) is nil
    e.g. utf_16le_emoji_string.split("\n")
    e.g. valid_unicode_string.encode(utf8_encoding) << ascii_string
  Encoding::InvalidByteSequenceError:
    when the string being transcoded contains a byte invalid for
    either the source or target encoding
    e.g. "\x80".encode('UTF-8','US-ASCII')
    vs "\x80".encode('UTF-8','US-ASCII', invalid: :replace, replace: '<byte>')
    # => '<byte>'
  ArgumentError
    when operating on a string with invalid bytes
    e.g."\x80".split("\n")
  TypeError
    when a symbol is passed as an encoding
    Encoding.find(:"UTF-8")
    when calling force_encoding on an object
    that doesn't respond to #to_str

Raised by transcoding methods:
  Encoding::ConverterNotFoundError:
    when a named encoding does not correspond with a known converter
    e.g. 'abc'.force_encoding('UTF-8').encode('foo')
    or a converter path cannot be found
    e.g. "\x80".force_encoding('ASCII-8BIT').encode('Emacs-Mule')

Raised by byte <-> char conversions
  RangeError: out of char range
    e.g. the UTF-16LE emoji: 128169.chr
```

See [lib/encoded_string.rb](lib/encoded_string.rb) and
[spec/encoded_string_spec.rb](spec/encoded_string_spec.rb) for more information.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bf4/encoded_string. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

