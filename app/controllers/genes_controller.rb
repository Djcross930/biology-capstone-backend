class GenesController < ApplicationController

  def index
    genes = Gene.all
    render json: genes.as_json
  end



end
