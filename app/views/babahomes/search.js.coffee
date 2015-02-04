$("#result").empty()
  .append("<%= escape_javascript(render 'babahomes/search_result', babahomes: @babahomes) %>")