class ItemsController < ApplicationController  
  def index
    p current_user
    p "!!!current_user"
    @items = current_user.items
    render :index
  end

  def create 
    @item = Item.create(
    title: params[:title],
    price: params[:price],
    description: params[:description],
    image_url: params[:image_url],
    brand: params[:brand],
    link: params[:link],
    user_id: current_user.id
    ) 
    render :show
  end

  def show
    @item = Item.find_by(id: params[:id])
    render :show
  end

 def update
   @item = Item.find_by(id:params[:id])
   @item.update(
    title: params[:title] || @item.title,
    price: params[:price] || @item.price,
    description: params[:description] || @item.description,
    image_url: params[:image_url] || @item.image_url,
    brand: params[:brand] || @item.brand,
    link: params[:link] || @item.link,
   )
   render :show
 end

 def destroy
  @item = Item.find_by(id: params[:id])
  @item.destroy
  render json: {message: "the item destroyed successfully"}
 end
 
end
