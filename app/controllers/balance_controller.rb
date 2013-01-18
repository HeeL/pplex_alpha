class BalanceController < ApplicationController
  
  before_filter :authenticate_user!, except: :process_payment

  def index
    check_status
  end

  def process_payment
    amount = params[:outsum]
    signature = md5("#{amount}:#{params[:invid]}:#{ENV['ROBO_PASS2']}").upcase
    current_user.add_money(amount) if signature == params[:signature]
    render nothing: true
  end

  def robokassa
    amount = params[:amount].to_i
    signature =  md5("#{ENV['ROBO_LOGIN']}:#{amount}:0:#{ENV['ROBO_PASS1']}")
    request = {
      outSum: amount,
      signatureValue: signature,
      incCurrLabel: ENV['ROBO_PAY_METHOD'],
      mrchLogin: ENV['ROBO_LOGIN'],
      desc: 'Increase balance on pplex.net',
      culture: 'en',
      invId: 0,
      encoding: 'utf-8',
    }.to_query

    redirect_to "#{ENV['ROBO_URL']}?#{request}"
  end

  private

  def check_status
    flash[:notice] = 'You have successfully increased your balance' if params[:status] == 'success'
    flash[:error] = 'You did not increase your balance' if params[:status] == 'fail'
  end

end