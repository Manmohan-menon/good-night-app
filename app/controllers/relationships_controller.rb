class RelationshipsController < ApplicationController
    def create
        @relationship = Relationship.new(relationship_params)
    
        if @relationship.save
          render json: @relationship, status: :created
        else
          render json: { errors: @relationship.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotUnique => e
        render json: { errors: e.message }, status: :unprocessable_entity
    end
    
    def destroy
        @relationship = Relationship.find(params[:id])
        @relationship.destroy
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { errors: "Relationship not found" }, status: :not_found
    end

    private

    def relationship_params
        params.require(:relationship).permit(:follower_id, :followee_id)
    end
end
