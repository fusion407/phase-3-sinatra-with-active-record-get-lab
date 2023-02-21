class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(only: [:id, :name], include: {
      baked_goods: {only: [:name, :price]}
    })
  end
  get '/baked_goods/by_price' do
    baked_good = BakedGood.all.order(:price).reverse
    baked_good.to_json
  end
  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.all.order(:price).reverse.first
    baked_good.to_json

  end

end
