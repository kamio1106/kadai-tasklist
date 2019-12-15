class TasksController < ApplicationController
    before_action :set_task , only: [:show,:edit,:update,:destroy]
    def index
        @tasks=Task.order(id: :desc).page(params[:page]).per(10)
    end

    def show
        @task=Task.find(params[:id])
    end

    def new
        @task=Task.new
    end

    def create
        @task=Task.new(task_params)
        if @task.save
            flash[:success] = '新規投稿が完了しました。'
            redirect_to @task
        else
            flash.now[:danger] = "新規投稿に失敗しました。"
            render :new
        end
        
    end

    def edit
        @task=Task.find(params[:id])
    end

    def update
        @task=Task.find(params[:id])
        if @task.update(task_params)
            flash[:success] = '投稿が更新されました'
            redirect_to @task
        else
            flash.now[:danger] = "投稿の更新に失敗しました。"
            render :edit
        end
        
        
    end

    def destroy
        @task=Task.find(params[:id])
        @task.destroy
        flash[:success] = '投稿は正常に削除されました'
        redirect_to tasks_url
    end
    
    private
    def task_params
       params.require(:task).permit(:content,:status) 
    end
    def set_task
        @task=Task.find(params[:id])
    end
end