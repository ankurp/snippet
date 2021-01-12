class SnippetsController < ApplicationController
  before_action :set_snippet, only: [:show, :like, :update, :destroy]
  before_action :authenticate, only: [:update]

  # GET /snippets
  def index
    @snippets = Snippet.not_expired.all
  end

  # GET /snippets/1
  def show
    @snippet.bump_expiration.save
  end

  # POST /snippets
  def create
    @snippet = Snippet.new(snippet_params)

    if @snippet.save
      render @snippet, status: :created, location: @snippet
    else
      render json: @snippet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /snippets/1
  def update
    if @snippet.bump_expiration.update(snippet_params)
      render @snippet
    else
      render json: @snippet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /snippets/1
  def destroy
    @snippet.destroy
  end

  def like
    @snippet.bump_expiration
    @snippet.likes = @snippet.likes + 1
    @snippet.save
    render @snippet
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snippet
      @snippet = Snippet.not_expired.find(params[:id])
    end

    def authenticate
      if snippet_params[:password] == @snippet.password
        render json: {}, status: :unauthorized and return
      end
    end

    # Only allow a list of trusted parameters through.
    def snippet_params
      params.permit(:name, :expires_in, :snippet, :password)
    end
end
