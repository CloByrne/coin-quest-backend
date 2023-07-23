module Api
    class CreaturesController < ApplicationController
      def search
        search_query = params[:q]
  
        if search_query.present?
          # Use ILIKE on PostgreSQL or LOWER + LIKE on SQLite for case-insensitive searching
          if Rails.configuration.database_configuration[Rails.env]['adapter'].include?('postgresql')
            results = MockDatum.where("name ILIKE :query OR money ILIKE :query", query: "%#{search_query}%")
          else
            lowercase_query = search_query.downcase
            results = MockDatum.where("LOWER(name) LIKE :query OR LOWER(money) LIKE :query", query: "%#{lowercase_query}%")
          end
  
          render json: results
        else
          creatures = MockDatum.all
          render json: creatures
        end
      rescue StandardError => e
        render json: { error: "An error occurred: #{e.message}" }, status: :internal_server_error
      end
  
      # GET /api/creatures
      def index
        creatures = MockDatum.all
        render json: creatures
      rescue StandardError => e
        render json: { error: "An error occurred: #{e.message}" }, status: :internal_server_error
      end
    end
  end
  