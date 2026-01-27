{% macro multiply(a, b, precision) %}
    ROUND({{ a }} * {{ b }}, {{ precision }})
{% endmacro %}