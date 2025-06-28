
{{ raw("dart").setConfig("lang") }}
// ignore_for_file: camel_case_types, constant_identifier_names

{{#range components.schemas.parseSchemas() }}
{{#if .__value.containsKey('enum') }}
enum {{.__key}}{
  {{#range .__value.enum}}
    {{.}},
  {{%}}
}
{{%}}

{{^ .__value.containsKey('enum') }}

class {{.__key}}{
    {{! constructor !}}
  {{.__key}}({
    {{#range .__value.properties}}
       required  this.{{.__key.toCamelCase()}},
      {{%}}
  });
  {{! end constructor !}}

  {{! start fromJson !}}

  factory {{.__key}}.fromJson(Map<String, dynamic> json) {
    return {{.__key}}(
      {{#range .__value.properties}}
        {{.__key.toCamelCase()}}: json['{{.__key}}'] as {{.__value.openAPIType()}},
      {{%}}
    );
  }
  {{! end fromJson !}}



  {{#range .__value.properties}}
   final {{.__value.openAPIType()}} {{.__key.toCamelCase()}}; {{#if .__value.containsKey('enum')}} // {{.__value.enum}} {{%}}
  {{%}} 
     
    




  {{! start toJson !}}
  Map<String, dynamic> toJson() {
    return {
      {{#range .__value.properties}}
      '{{.__key.toCamelCase()}}': {{.__key.toCamelCase()}},
      {{%}}
    };
  }
  {{! end toJson !}}


  {{! start toString !}}
  @override
  String toString() {
    return toJson().toString();
  }
  {{! end toString !}}

  {{! deep comparison !}}

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is {{.__key}} 
        {{#range .__value.properties}}
       && other.{{.__key.toCamelCase()}} == {{.__key.toCamelCase()}} 
        {{%}}
    ;
  }

  @override
  int get hashCode {
    return {{#range .__value.properties.keys()}}
     {{__index.equals(0).ifNotTrueReturn('^')}} {{.toCamelCase()}}.hashCode 
    {{%}}
         
    ;
  }

  {{! end deep comparison !}}

}
{{%}}


{{%}} {{! end range !}}
