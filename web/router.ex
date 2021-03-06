defmodule Spark.Router do
  use Spark.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Spark do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end
end
