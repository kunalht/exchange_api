require 'net/http'

class ExchangeRateService
  def initialize(url)
    @url = url
  end

  def exchange_amount(params)
    currency_from = params['currency_from']
    currency_to = params['currency_to']
    currency_amount = params['amount']

    url = "#{@url}#{currency_from}"
    puts url
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed_response = JSON.parse(response)

    rate = parsed_response['rates'][currency_to.upcase]
    currency_amount.to_f * rate.to_f
  end
end