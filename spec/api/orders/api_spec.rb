require 'rails_helper'

RSpec.describe Api::V1::OrdersController do
  it 'responds with a OK status' do
    get '/api/v1/orders'

    expect(response).to be_truthy
  end
end
