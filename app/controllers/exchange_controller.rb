class ExchangeController < ApplicationController

  def exchange_api
    url = 'https://open.exchangerate-api.com/v6/latest/'
    response = ExchangeRateService.new(url).exchange_amount(exchange_api_params)

    render json: {converted_amount: response}
  end

  private

  def exchange_api_params
    params.require(:exchange_api).permit(
      :currency_from,
      :currency_to,
      :amount
    )
  end
end
