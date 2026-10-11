# {{ data.basics.name }}

{{ data.basics.location.city }}, {{ data.basics.location.countryCode }} | {{ data.basics.email }} | {{ data.basics.phone }}{% if data.basics.profiles.linkedin and data.basics.profiles.linkedin.url %} | {{ data.basics.profiles.linkedin.url }}{% endif %}

## Professional Summary

{{ data.basics.summary }}

## Professional Experience

{% for exp_item in data.work %}
### {{ exp_item.position }} | {{ exp_item.name }}
{{ exp_item.location.city }}, {{ exp_item.location.countryCode }} | {{ exp_item.startDate }} - {{ exp_item.endDate }}

{% for exp_summary_item in exp_item.summary %}
- {{ exp_summary_item }}
{% endfor %}

{% endfor %}
## Additional Information

{% for title, skills in data.skills.items() %}
- **{{ title }}:** {{ "; ".join(skills) }}
{% endfor %}

## Languages

{% for lang_item in data.languages %}
- **{{ lang_item.language }}:** {{ lang_item.fluency }}
{% endfor %}

## Education

{% for edu_item in data.education %}
### {{ edu_item.institution }}
{{ edu_item.location.city }}, {{ edu_item.location.countryCode }} | {{ edu_item.startDate }} - {{ edu_item.endDate }}

*{{ edu_item.degree }}*

{% endfor %}
