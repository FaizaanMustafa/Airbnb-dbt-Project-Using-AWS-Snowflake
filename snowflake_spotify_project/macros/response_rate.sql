{%macro response_rate(col) %}
    case 
        when {{col}} > 95 then 'Very Good'
        when {{col}} > 80 then 'Good'
        when {{col}} > 60 then 'Average'
        else 'Poor'
    end
{% endmacro %}