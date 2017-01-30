module AdsenseMobile
  module Rails
    module ActionView
      module Base
        extend ActiveSupport::Concern

        def adsense_mobile_tag(options)
          if options.is_a?(Hash)
            if options[:overlays] && options[:vignettes]
              page_level_tag = ::Rails.env.production? ? content_tag(:script, meta_data(options), nil, false) : massage_box(options)
              base_script + page_level_tag
            elsif options[:overlays]
              page_level_tag = ::Rails.env.production? ? content_tag(:script, overlays(options), nil, false) : massage_box(options)
              base_script + page_level_tag
            elsif options[:vignettes]
              page_level_tag = ::Rails.env.production? ? content_tag(:script, vignettes(options), nil, false) : massage_box(options)
              base_script + page_level_tag
            elsif options[:client]
              page_level_tag = ::Rails.env.production? ? content_tag(:script, testing_data(options), nil, false) : massage_box(options)
              base_script + page_level_tag
            else
              base_script + massage_box('You are passing wrong parameters, please check documentation.')
            end
          else
            base_script + massage_box('You are passing wrong parameters, please check documentation.')
          end
        end

        private

          def testing_data(options)
            "(adsbygoogle = window.adsbygoogle || []).push({
              google_ad_client: \"#{options[:client]}\",
              enable_page_level_ads: true
            });"
          end

          def meta_data(options)
            "(adsbygoogle = window.adsbygoogle || []).push({
              google_ad_client: \"#{options[:client]}\",
              enable_page_level_ads: true,
              vignettes: {google_ad_channel: \"#{options[:vignettes]}\"},
              overlays: {google_ad_channel: \"#{options[:overlays]}\"}
            });"
          end

          def vignettes(options)
            "(adsbygoogle = window.adsbygoogle || []).push({
              google_ad_client: \"#{options[:client]}\",
              enable_page_level_ads: true,
              vignettes: {google_ad_channel: \"#{options[:vignettes]}\"}
            });"
          end

          def overlays(options)
            "(adsbygoogle = window.adsbygoogle || []).push({
              google_ad_client: \"#{options[:client]}\",
              enable_page_level_ads: true,
              overlays: {google_ad_channel: \"#{options[:overlays]}\"}
            });"
          end

          def base_script
            src = "#{request.protocol}pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"
            content_tag(:script, nil, async: true, src: src)
          end

          def massage_box(options)
            content_tag(:span, options, style: "background: #000; color: #fff;")
          end

      end
    end
  end
end
