class GenesController < ApplicationController
  require 'http'
  def index
    if current_user
      user_genes = []
      @genes = ActiveRecord::Base.connection.execute("SELECT DISTINCT ON (common_name) common_name, id, user_id FROM genes;")
      @genes.each do |gene|
        if gene["user_id"] == current_user.id
          user_genes << gene
        else
        end
      end
      render template: "genes/index"
      # render template: "genes/index"
    # else
    #   genes = Gene.all
    #   render json: genes.as_json
    end
  end

  def show
    @gene = Gene.find_by(id: params[:id])
    render template: "genes/show"
  end

  def create
    if current_user
      @gene = Gene.new
      @gene.common_name = params[:common_name]
      info = HTTP.get("https://rest.ensembl.org/xrefs/symbol/homo_sapiens/#{@gene.common_name}?content-type=application/json").parse
      @gene.ens_id = info[0]["id"]
      info_one = HTTP.get("https://rest.ensembl.org/sequence/id/#{@gene.ens_id}?type=cds&multiple_sequences=100&content-type=application/json").parse
      info_one = info_one[0]["seq"]
      @gene.cds_sequence = info_one
      @gene.user_id = current_user.id
      @gene.save
      render template: "genes/show"
    else
      @gene = Gene.new
      @gene.common_name = params[:common_name]
      info = HTTP.get("https://rest.ensembl.org/xrefs/symbol/homo_sapiens/#{@gene.common_name}?content-type=application/json").parse
      @gene.ens_id = info[0]["id"]
      info_one = HTTP.get("https://rest.ensembl.org/sequence/id/#{@gene.ens_id}?type=cds&multiple_sequences=100&content-type=application/json").parse
      info_one = info_one[0]["seq"]
      @gene.cds_sequence = info_one
      render template: "genes/show"
    end
  end
end
