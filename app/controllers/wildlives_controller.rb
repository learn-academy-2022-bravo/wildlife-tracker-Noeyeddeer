class WildlivesController < ApplicationController
    def index
        wildlives = Wildlife.all 
        render json: wildlives
    end

    def show
        wildlives = Wildlife.find(params[:id])
        render json: wildlives
    end

    def create
        wildlives = Wildlife.create(wildlives_params)
        if wildlives.valid?
            render json: wildlives
        else
            render json: wildlives.errors
        end
    end

    def update
        wildlives = Wildlife.find(params[:id])
        wildlives.update(wildlives_params)
        if wildlives.valid?
            render json: wildlives
        else
            render json: wildlives.errors
        end
    end

    def destroy
        wildlives = Wildlife.find(params[:id])
        if wildlives.destroy
            render json: wildlives
        else
            render json: wildlives.errors
        end
    end
    
    private
    def wildlives_params
        params.require(:wildlife).permit(:common_name, :latin_name, :kingdom)
    end
end
