
class AuthController < ApplicationController 


    def random
        all = RestClient.get("https://api.unsplash.com/photos/random/?count=12",
        {
            "Authorization": "Client-ID #{Rails.application.credentials.unsplash_access_key}"
        })
        parsed = JSON.parse(all);
        render json: parsed
        
    end 

    def search 
        all = RestClient.get("https://api.unsplash.com/search/photos/?query=#{params[:Search]}&per_page=24",
        {
            "Authorization": "Client-ID #{Rails.application.credentials.unsplash_access_key}"
        })

        parsed = JSON.parse(all);
        render json: parsed 
    end 
end 

