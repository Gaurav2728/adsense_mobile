module AdsenseMobile
  module Rails
    class Railtie < ::Rails::Railtie

      initializer 'adsense_mobile.action_view' do
        ActiveSupport.on_load :action_view do
          ::ActionView::Base.include(
            AdsenseMobile::Rails::ActionView::Base
          )
        end
      end

    end
  end
end
