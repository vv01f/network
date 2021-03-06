{%- for hostname, conf in pillar['cpe'].items() %}
/root/{{ hostname }}.sh:
  file.managed:
    - source: salt://cpe/ap.sh
    - template: 'jinja'
    - context:
        hostname: {{ hostname }}
        conf: {{ conf }}
    - mode: 755

{%- endfor %}
