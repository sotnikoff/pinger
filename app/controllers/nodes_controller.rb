class NodesController < ApplicationController
  before_action :authenticate_user!
  before_action :node, only: %i[show edit update destroy ping]

  def index
    @nodes = Node.page.all
  end

  def show
    @pings = @node.node_pings.page(params[:page]).per(30)
  end

  def edit; end

  def update
    if @node.update(node_params)
      redirect_to @node, notice: 'Updated Node'
    else
      render :edit
    end
  end

  def new
    @node = Node.new
  end

  def create
    @node = Node.new(node_params)
    if @node.save
      redirect_to nodes_path, notice: 'Created Node'
    else
      render :new
    end
  end

  def destroy
    @node.destroy
    redirect_to decks_path, notice: 'Node destroyed'
  end

  def ping
    @result = @node.ping ? 'Pass' : 'Fail'
    @pings = @node.node_pings.first(10)
  end

  private

  def node
    @node = Node.find(params[:id])
  end

  def node_params
    params.require(:node).permit(:title, :description, :check, :ip)
  end
end
