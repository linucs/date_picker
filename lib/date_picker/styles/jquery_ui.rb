module DatePicker
  module Styles
    class JqueryUi
      def types
        [:date]
      end
      def mapping()
        :jquery_ui
      end
      def template()
        %{
          <%= input_html %>
          <input id="<%= input_id %>_hidden" type="hidden" value="<%= value %>" name="<%= name %>"/>
          <script>
            (function() {
              jQuery('#<%= input_id %>').datepicker($.extend({
                monthNames: <%= month_names.to_json %>,
                monthNamesShort: <%= abbr_month_names.to_json %>,
                dayNames: <%= day_names.to_json %>,
                dayNamesMin: <%= abbr_day_names.to_json %>,
                dayNamesShort: <%= abbr_day_names.to_json %>
              }, <%= json_options %>, {
                locale: <%= locale.to_json %>,
                dateFormat: <%= format.to_json %>
              })).on('change', function(e) {
                jQuery('#<%= input_id %>_hidden').val($.datepicker.formatDate('<%= data_format %>', jQuery('#<%= input_id %>').datepicker('getDate')));
              });
              <% if time %> jQuery('#<%= input_id %>').datepicker('setDate', new Date(<%= time %>)); <% end %>
            })();
          </script>
        }
      end
    end
  end
end
