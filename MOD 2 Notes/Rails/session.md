https://learn.co/tracks/web-development-immersive-2-0-module-two/rails/authentication/cookies-and-sessions#      
      
      # set cart_id
      session[:cart_id] = @cart.id
     
      # load the cart referenced in the session
      @cart = Cart.find(session[:cart_id])

    # sign(message: string, key: string) -> signature: string
    def sign(message, key):
      # cryptographic magic here
      return signature
    end

    # Routed from POST /items/:id/add_to_cart
    def add_to_cart
      # Get the item from the path
      @item = Item.find(params[:id])
     
      # Load the cart from the session, or create a new empty cart.
      cart = session[:cart] || []
      cart << @item.id
     
      # Save the cart in the session.
      session[:cart] = cart
    end