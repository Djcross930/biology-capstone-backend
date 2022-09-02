class GenesController < ApplicationController

  def index
    genes = Gene.all
    render json: genes.as_json
  end

  def show
    gene = Gene.find_by(id: params[:id])
    render json: gene.as_json
  end

end
