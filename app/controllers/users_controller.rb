class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :initialize_search, only: :index

  # GET /users or /users.json
  def index
    handle_search_name
    # handle_filters
    @topics = Topic.all
  end

  def clear
    clear_session(:search_name, :filter)
    redirect_to users_path
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create

    @user = User.create(user_params)
    @errors = []
    if @user.email.include? "."

      if @user.first_name.length > 1 && @user.last_name.length > 1
        #true - check for no special characters and no numbers
        special = "?<>',?[]}{=-)(*&^%$#`~{}"
        regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
        if @user.first_name =~ regex || @user.last_name =~ regex
          # contains special char
          @errors << "Your name cannot contain special characters"
          session[:errors] = @errors
          redirect_to root_path
        else

          def has_digits?(str)
            str.count("0-9") > 0
          end

          if has_digits?(@user.first_name)
            @errors << "Your first name cannot contain numbers"
            session[:errors] = @errors
            redirect_to root_path
          else
            if has_digits?(@user.last_name)
              @errors << "Your last name cannot contain numbers"
              session[:errors] = @errors
              redirect_to root_path
            else
              @user.save
              redirect_to success_path
            end
          end


        end
      else
        @errors << "Both first and last name must at least be 2 characters long"
        session[:errors] = @errors
        redirect_to root_path
      end
    else
      @errors << "An email must contain at least one full stop (.)"
      session[:errors] = @errors
      redirect_to root_path

    end
    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: "User was successfully created." }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

    def initialize_search
      session[:search_name] ||= params[:search_name]
      session[:filter] = params[:filter]
    end

    def handle_search_name
      if session[:search_name]
        # raise "hell"
        @users = User.where("first_name LIKE ?", "%#{session[:search_name].titleize}%")
      else
        users = User.where(admin: false)
        @users = users.sort_by { |u| [u.first_name, u.last_name] }
      end

    end

    def handle_filters
      if session[:filter]
      topic = Topic.where(name: session[:filter])
      id = topic.ids.first
      currentTopic = Topic.find id
      users = currentTopic.users
      @users = User.where(admin: false)
      @users = users.sort_by { |u| [u.first_name, u.last_name] }

    else

      users = User.where(admin: false)
      @users = users.sort_by { |u| [u.first_name, u.last_name] }
    end
  end

end
