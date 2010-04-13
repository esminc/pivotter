Admin.controllers :projects do

  get :index do
    @projects = Project.all
    render 'projects/index'
  end

  get :new do
    @project = Project.new
    render 'projects/new'
  end

  post :create do
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = 'Project was successfully created.'
      redirect url(:projects, :edit, :id => @project.id)
    else
      render 'projects/new'
    end
  end

  get :edit, :with => :id do
    @project = Project.get(params[:id])
    render 'projects/edit'
  end

  put :update, :with => :id do
    @project = Project.get(params[:id])
    if @project.update(params[:project])
      flash[:notice] = 'Project was successfully updated.'
      redirect url(:projects, :edit, :id => @project.id)
    else
      render 'projects/edit'
    end
  end

  delete :destroy, :with => :id do
    project = Project.get(params[:id])
    if project.destroy
      flash[:notice] = 'Project was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Project!'
    end
    redirect url(:projects, :index)
  end
end