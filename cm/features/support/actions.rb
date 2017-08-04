module Datasite
    module Actions
      ##
      #
      # Takes a value and enters the first 3 chars
      # and selects it in the Ext combo or typeahead field matching
      # the from label
      #
      # @param [String] value Which option to select
      # @option options [String] :from  The label text to match
      #
      # example: select_extjs_dropdown project[:revenue_site], :from => '* Revenue Site:'
      # replaces:
      #  revId = find('label', :text => '* Revenue Site:')[:for]
      #  revSite = find('#' + revId)
      #  revSite.click
      #  revSite.send_keys(project[:revenue_site][0..3])
      #  find('.x-combo-list .x-combo-list-item', :text => project[:revenue_site]).click
      #
      def select_extjs_dropdown(value, options={})
        raise "Must pass a hash containing 'from'" if not options.is_a?(Hash) or not options.has_key?(:from)
        fieldId = find('label', :text => options[:from])[:for]
        field = find('#' + fieldId)
        field.click
        if value.length == 0
          field.send_keys(:delete)
        else
          if field.value.length == 0
            field.send_keys(value[0..3])
          else
            find('#' + fieldId + ' ~img').click
          end
          find('.x-combo-list .x-combo-list-item', :text => value).click
        end
      end

      ##
      #
      # Takes a value and enters the first 3 chars
      # and selects it in the Ext combo matching
      # the hidden field name
      #
      # @param [String] value Which option to select
      # @option options [String] :hidden_name  ExtJS combo hidden field name
      #
      # example: select_extjs_dropdown_by_hiddenname cr[1], :hidden_name => 'clientRegion'
      #
      def select_extjs_dropdown_by_hiddenname(value, options={})
        raise "Must pass a hash containing 'hidden_name'" if not options.is_a?(Hash) or not options.has_key?(:hidden_name)
        field = find('input[name=\'' + options[:hidden_name] + '\'] ~input')
        field.click
        field.send_keys(value[0..3])
        find('.x-combo-list .x-combo-list-item', :text => value).click
      end

      ##
      #
      # Uses the alfresco node browser and runs a lucene query
      # and waits for the results to come back
      #
      # @param [String] query lucene query
      #
      # example: select_extjs_dropdown_by_hiddenname cr[1], :hidden_name => 'clientRegion'
      #
      def execute_lucene_in_node_browser(query, options={})
        visit URIS[:node_browser_uri]
        select 'lucene', :from => 'nodebrowser-search'
        fill_in 'nodebrowser-query', :with => query
        click_on 'Execute'
        click_on 'Execute'
        header = find 'h2', :text => 'Results'
        check_text = /Results \((?<count>\d+)\)/

        while (header.text =~ check_text).nil? do
          click_on 'Execute'
          return count
        end
      end
    end
end
include Datasite::Actions