class TasksController < ApplicationController
  #make complete and incomplete tasks for the index.
  def index
    sleep 1
    @complete_tasks = Task.where(complete: true)
    @incomplete_tasks = Task.where(complete: false)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.create!(params[:task])
    @task.complete = 0
    if @task.save
    	#logger.debug "New task: #{@task.attributes.inspect}"
    	respond_to do |format|
    		format.html {redirect_to tasks_url, notice: 'Task was successfully created.' }
    		format.js
    	end
    end
  end

  # PUT /tasks/1
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes!(params[:task]) #maybe a '!' after atributes?
    	respond_to do |format|
    		format.html {redirect_to tasks_url}
    		format.js
    	end
   	end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end
end
