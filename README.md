[![Gem Version](https://badge.fury.io/rb/adsense_mobile.svg)](https://badge.fury.io/rb/adsense_mobile)

# AdsenseMobile

It is a helper to create the google adsense page-level ads tag in rails. Instead of using vanilla javascript for managing google adsense, it would be easier and hassle free to use `adsense_mobile_tag` tag to achieve the same.


## Installation

Add below line to your application's Gemfile:

```ruby
gem 'adsense_mobile'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install adsense_mobile

## Usage

Basic page-level ads

  `<%= adsense_mobile_tag client: 'ca-pub-269xxxxxxxxxx' %>`

Currently, the Page-level ads family includes the Anchor/overlay and Vignette ad formats, <a href="https://support.google.com/adxseller/answer/6068103?hl=en" target="_blank">see the Google Documentation Guide.</a>

**Place below tag in the `<head>` section (or at the top of the `<body>`) of the pages where you want to show the ads.**

1. For Anchor/overlay ads

  `<%= adsense_mobile_tag client: 'ca-pub-269xxxxxxxxxx', overlays: '89xxxxxxx' %>`

2. For Vignette ads
  
  `<%= adsense_mobile_tag client: 'ca-pub-269xxxxxxxxxx', vignettes: '70xxxxxxx' %>`

3. For Anchor and Vignette ads

  `<%= adsense_mobile_tag client: 'ca-pub-269xxxxxxxxxx', vignettes: '70xxxxxxx', overlays: '89xxxxxxx' %>`


It automatically maps required parameter according to google adsence API.
```
     client: 'ca-pub-269xxxxxxxxxx'    google_ad_client: 'ca-pub-269xxxxxxxxxx'
   overlays: '89xxxxxxx'                       overlays: { google_ad_channel: '89xxxxxxx' }
  vignettes: '70xxxxxxx'                      vignettes: { google_ad_channel: '70xxxxxxx' }
```

NOTE: If environment is not production, it'll show passed parameters in `span` tag.

> {:client=&gt;"ca-pub-2691264448085943", :vignettes=&gt;"7013276711", :overlays=&gt;"7013276711"}


To test page-level ads on production or on a mobile device, visit your page (website) and add `#googleads` to the end of the URL and reload the page.

If parameters are invalid, it shows error massage in `span` tag.

> You are passing wrong parameters, please check documentation.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/adsense_mobile. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
