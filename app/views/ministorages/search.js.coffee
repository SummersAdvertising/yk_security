$("#result").empty()
  .append("<%= escape_javascript(render 'ministorages/search_result', ministorages: @ministorages) %>")