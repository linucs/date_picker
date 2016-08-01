module DatePicker
  module Styles
    class Bootstrap
      def types
        [:date, :datetime, :time]
      end
      def options()
        {
          class: 'form-control'
        }
      end
      def mapping()
        :moment
      end
      def template()
        %{
          <div id="<%= input_id %>_container" class="input-group">
            <div class="input-group-addon" style="cursor: pointer">
              <span class="fa fa-calendar"></span>
            </div>
            <%= input_html %>
          </div>
          <input id="<%= input_id %>_hidden" type="hidden" value="<%= formatted_value %>" name="<%= name %>"/>
          <script>
            (function() {
              var
                datepicker = jQuery('#<%= input_id %>_container').datetimepicker(jQuery.extend({}, <%= json_options %>, {
                  locale: <%= locale.to_json %>,
                  format: <%= format.to_json %>
                }))
                .on('dp.change', function(e) {
                  jQuery('#<%= input_id %>_hidden').val(e.date ? e.date.format('<%= data_format %>') : '');
                }).data('DateTimePicker');
              <% if time %> datepicker.date(moment(new Date(<%= time %>))); <% end %>
            })();
          </script>
        }
      end
    end
  end
end
