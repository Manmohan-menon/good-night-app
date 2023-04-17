class RelationshipsController < ApplicationController
    def create
        relationship = Relationship.new(relationship_params)
        if relationship.save
            render json: relationship, status: :created
        else
            render json: relationship.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
    relationship = Relationship.find(params[:id])
    relationship.destroy
    head :no_content
    end

    private

    def relationship_params
    params.require(:relationship).permit(:follower_id, :followee_id)
    end
end
