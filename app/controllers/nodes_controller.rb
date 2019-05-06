# frozen_string_literal: true

class NodesController < ApplicationController
  before_action :authenticate_user!
  before_action :node, only: %i[show edit update destroy ping]

  def index
    @nodes = Node.kept.all
  end

  def show
    @pings = if params[:failed].present?
               @node.node_pings.failed.page(params[:page]).per(30)
             else
               @node.node_pings.page(params[:page]).per(30)
             end
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
    @node.discard
    redirect_to nodes_path, notice: 'Node destroyed'
  end

  def ping
    @result = @node.ping ? 'Pass' : 'Fail'
    @pings = @node.node_pings.first(10)
  end

  private

  def node
    @node = Node.kept.find(params[:id])
  end

  def node_params
    params.require(:node).permit(:title, :description, :check, :ip)
  end
end
