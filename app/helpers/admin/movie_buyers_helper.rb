module Admin::MovieBuyersHelper
  def   buyer_filters(options)
    params.permit(:status, :ticket_id).merge(options)
  end
end
