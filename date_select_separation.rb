# frozen_string_literal: true

module ActionView
  #:nodoc
  module Helpers
    class DateTimeSelector #:nodoc:
      include ActionView::Context

      private

      def build_selects_from_types(order)
        select = +''
        first_visible = order.find { |type| !@options[:"discard_#{type}"] }
        order.reverse_each do |type|
          if @options[:tag_separator].is_a?(Hash)
            select.insert(0, add_tag_separator(type))
          else
            separator = separator(type) unless type == first_visible
            select.insert(0, add_plain_separator(separator, type))
          end
        end
        select.html_safe
      end

      # Plain separator
      def add_plain_separator(separator, type)
        separator.to_s + public_send("select_#{type}").to_s
      end

      # tag block separator
      def add_tag_separator(type)
        tag_separator = @options[:tag_separator]
        content_tag tag_separator[:name], tag_separator[:options] do
          public_send("select_#{type}").to_s
        end
      end
    end
  end
end
