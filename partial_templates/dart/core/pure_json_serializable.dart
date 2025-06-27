
{{ raw("dart").setConfig("lang") }}

{{#range components.schemas.parseSchemas() }}

class {{.__key}}{
  
  {{#range .__value.properties}}
   {{.__value.required.ifTrueReturn('final')}} {{.__value.openAPIType()}}{{.__value.required.ifNotTrueReturn('?')}} {{.__key.toCamelCase()}}; {{#if .__value.containsKey('enum')}} // {{.__value.enum}} {{%}}
  {{%}} 
     
    

  {{.__key}}({
    {{#range .__value.properties}}
        {{.__value.required.ifTrueReturn('required')}}  this.{{.__key}},
      {{%}}
       

  });

  {{! start fromJson !}}

  factory {{.__key}}.fromJson(Map<String, dynamic> json) {
    return {{.__key}}(
      {{#range .__value.properties}}
         json['{{.__key}}'] as {{.__value.openAPIType()}}{{.__value.required.ifNotTrueReturn('?')}},
      {{%}}
    );
  }
  {{! end fromJson !}}



  {{! start toJson !}}
  Map<String, dynamic> toJson() {
    return {
      {{#range .__value.properties}}
      '{{.__key}}': {{.__key}},
      {{%}}
    };
  }
  {{! end toJson !}}


  {{! start toString !}}
  @override
  String toString() {
    return {{.__key}}.toJson().toString();
  }
  {{! end toString !}}

  {{! deep comparison !}}

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is {{.__key}} 
        {{#range .__value.properties}}
       && other.{{.__key}} == {{.__key}} 
        {{%}}
    ;
  }

  @override
  int get hashCode {
    return {{#range .__value.properties.keys()}}
     {{__index.equals(0).ifNotTrueReturn('^')}} {{.}}.hashCode 
    {{%}}
         
    ;
  }

  {{! end deep comparison !}}

}
{{%}}