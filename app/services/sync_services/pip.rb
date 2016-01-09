require 'capybara'
require 'capybara/dsl'
require 'capybara-webkit'

module SyncServices
  class Pip < Base
    include Capybara::DSL

    def initialize
      configure_capybara
    end

    def login(user_name, password)
      visit('/klient/logowanie')
      fill_in 'StoreLoginForm_username', with: user_name
      fill_in 'StoreLoginForm_password', with: password
      puts "PIP >>> Logged in using user name: #{user_name}"
      find('.Link_y_Zaloguj').click
    end

    def change_delivery_region(region_name)
      sleep 2
      visit("/zakupy#{region_name}")
      puts "PIP >>> Delivery region changed to: #{region_name}"
      sleep 2
    end

    def add_product_to_default_cart(product_pip_id, quantity)
      sleep 2
      visit("/towar/-/#{product_pip_id}")
      (quantity - 1).times { find('.ProductViewContainer .pcRight').click }
      find('.ProductViewContainer a.add-to-cart').click
      puts "PIP >>> Added #{product_pip_id} x #{quantity} to cart"
    end

    def save_default_cart_to_fastcard(fastcard_name)
      visit("/koszyk/lista")
      check 'select-all'
      find("#AQuickCart_id option[value='0']").click
      fill_in 'AQuickCart_name', with: fastcard_name
      find('.LinkWykonaj').click
      puts "PIP >>> Fastcard #{fastcard_name} saved"
    end

    private

    def configure_capybara
      Capybara.run_server = true
      Capybara.current_driver = :selenium
      Capybara.app_host = host
      Capybara.default_max_wait_time = 5

      Capybara::Webkit.configure do |config|
        config.debug = true
        config.allow_unknown_urls
      end
    end

    def host
      "http://www.e-piotripawel.pl"
    end
  end
end
