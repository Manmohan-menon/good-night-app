class SleepRecordsController < ApplicationController
    def create
        sleep_record = SleepRecord.new(sleep_record_params)
        if sleep_record.save
          render json: sleep_record, status: :created
        else
          render json: sleep_record.errors, status: :unprocessable_entity
        end
      end
    
      def clock_in_times
        clocked_in_times = User.clocked_in_times
        render json: clocked_in_times
      end
    
      def friends_records
        user = User.find(params[:user_id])
        friends_records = user.friends_sleep_records
        render json: friends_records
      end
    
      private
    
      def sleep_record_params
        params.require(:sleep_record).permit(:user_id, :start_time, :end_time)
      end
end
